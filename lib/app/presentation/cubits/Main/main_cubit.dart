import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart' as cfstore;
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:jubla/app/domain/entities/Chats/BusinessMessage.dart';
import 'package:jubla/app/domain/entities/Stocks/StockMovement.dart';

import '../../../../core/validators/validator.dart';
import '../../../data/models/Extras/EmailAndUidModel.dart';
import '../../../domain/entities/Business/Business.dart';
import '../../../domain/entities/Category/Category.dart';
import '../../../domain/entities/Customer/Customer.dart';
import '../../../domain/entities/Partner/Request.dart';
import '../../../domain/entities/Product/CategorizeProducts.dart';
import '../../../domain/entities/Product/Product.dart';
import '../../../domain/entities/Statistics/BusinessStatistic.dart';
import '../../../domain/entities/Transaction/Transaction.dart';
import '../../../domain/entities/Transaction/TransactionDetail.dart';
import '../../../domain/entities/User/User.dart';
import '../../../domain/repositories/MainRepository.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  final MainRepository mainRepository;
  final Validator validator;
  StreamSubscription _businessMessageSubscription;
  MainCubit({this.mainRepository, this.validator}) : super(MainState.initial());

  cfstore.CollectionReference businessChatRef =
      cfstore.FirebaseFirestore.instance.collection('chats');

  Future<void> syncAllData(
    int businessId,
    int userId, {
    Function() onSuccess,
    Function(String msg) onErrorProducts,
    Function(String msg) onErrorCategories,
    Function(String msg) onErrorCustomers,
    Function(String msg) onErrorTransactions,
    Function(String msg) onErrorUsers,
    Function(String msg) onErrorBusinesses,
    Function(String msg) onErrorStatistics,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingEverything: true));
    await getUserBusinesses(userId,
        onSuccess: () {}, onError: onErrorBusinesses);
    // await getEmailsAndUids(onSuccess: () {}, onError: (msg) {});
    await getBusinessProducts(businessId,
        onSuccess: (products) {}, onError: onErrorProducts);
    await getBusinessCategories(businessId,
        onSuccess: (categs) {}, onError: onErrorCategories);
    await getCustomers(businessId, onSuccess: () {}, onError: onErrorCustomers);
    await getBusinessTransactions(businessId,
        onSuccess: () {}, onError: onErrorTransactions);
    await getBusinessUsers(businessId, onSuccess: () {}, onError: onErrorUsers);
    await getStatistics(
        businessId,
        '${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()} 00:00:00',
        '${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()} 23:59:00',
        onSuccess: () {},
        onError: onErrorStatistics);
    onSuccess();
    emit(state.copyWith(isLoadingEverything: false));
  }

  void navigateView({
    Function() onCheckout,
    Function() onProducts,
    Function() onCustomers,
    Function() onTransactions,
    Function() onUsers,
    Function() onCalendar,
    Function() onNone,
  }) {
    if (state.user.previleges.isActivatedCheckout) {
      setPage('checkout');
      onCheckout();
    } else if (state.user.previleges.isActivatedProducts) {
      setPage('products');
      onProducts();
    } else if (state.user.previleges.isActivatedCustomers) {
      setPage('customers');
      onCustomers();
    } else if (state.user.previleges.isActivatedTransactions) {
      setPage('transactions');
      onTransactions();
    } else if (state.user.previleges.isActivatedUsers) {
      setPage('users');
      onUsers();
    } else if (state.user.previleges.isActivatedCalendar) {
      setPage('calendar');
      onCalendar();
    } else {
      setPage('settings');
      onNone();
    }
  }

  Future<void> getStatistics(
    int businessId,
    String fromDate,
    String toDate, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingStatistics: true));
    final _eitherFailureOrSuccess =
        await mainRepository.getStatistics(businessId, fromDate, toDate);
    if (_eitherFailureOrSuccess.isRight()) {
      final _stat = _eitherFailureOrSuccess.fold((_) => null, (e) => e);
      emit(state.copyWith(
        isLoadingStatistics: false,
        businessStatistic: _stat,
      ));
      onSuccess();
    } else {
      final failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingStatistics: false));
      onError('$failure');
    }
  }

  Future<void> getEmailsAndUids({
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingEmailAndUids: true));
    final _eitherFailureOrSuccess = await mainRepository.getEmailsAndUids();
    if (_eitherFailureOrSuccess.isRight()) {
      final _emailsAndUids =
          _eitherFailureOrSuccess.fold((_) => null, (e) => e);
      emit(state.copyWith(
        isLoadingEmailAndUids: false,
        emailAndUidList: _emailsAndUids,
      ));
      onSuccess();
    } else {
      final failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingEmailAndUids: false));
      onError('$failure');
    }
  }

  Future<void> saveTransaction(
    Transaction transaction, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isSavingTransaction: true));
    final _eitherFailureOrSaved = await mainRepository.saveTransaction(
        state.business.businessId, transaction);
    if (_eitherFailureOrSaved.isRight()) {
      final _transaction =
          _eitherFailureOrSaved.fold((_) => null, (trans) => trans);
      emit(state.copyWith(
        isSavingTransaction: false,
        transactionList: _transaction.reversed.toList(),
        filteredTransactionList: _transaction.reversed.toList(),
      ));
      onSuccess();
    } else {
      final failure = _eitherFailureOrSaved.fold((f) => f, (_) => null);
      emit(state.copyWith(isSavingTransaction: false));
      onError('$failure');
    }
  }

  Future<void> getUserBusinesses(
    int userId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingBusinesses: true));
    final _eitherFailureOrSuccess =
        await mainRepository.getUserBusinesses(userId);
    if (_eitherFailureOrSuccess.isRight()) {
      final _businesses =
          _eitherFailureOrSuccess.fold((_) => null, (businesses) => businesses);
      emit(state.copyWith(
        isLoadingBusinesses: false,
        businessList: _businesses,
        filteredBusinessList: _businesses,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingBusinesses: false));
      onError('$_failure');
    }
  }

  Future<void> createBusiness(
    int userId,
    String businessName,
    String businessPhone,
    String businessAddress1,
    String businessImage, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingBusiness: true));
    final _eitherFailureOrSuccess = await mainRepository.createBusiness(
      userId,
      businessName,
      businessPhone,
      businessAddress1,
      businessImage,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _businesses =
          _eitherFailureOrSuccess.fold((_) => null, (businesses) => businesses);
      emit(state.copyWith(
        isCreatingBusiness: false,
        businessList: _businesses,
        filteredBusinessList: _businesses,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingBusiness: false));
      onError('$_failure');
    }
  }

  Future<void> updateBusinessInfo(
    int businessId,
    int userId,
    String businessName,
    String businessPhone,
    String businessAddress1,
    String businessColor,
    bool isBusinessActive, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingBusiness: true));
    final _eitherFailureOrSuccess = await mainRepository.updateBusinessInfo(
      businessId,
      userId,
      businessName,
      businessPhone,
      businessAddress1,
      businessColor,
      isBusinessActive,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _businesses =
          _eitherFailureOrSuccess.fold((_) => null, (businesses) => businesses);
      var currentBusinessEdit =
          _businesses.firstWhere((e) => e.businessId == businessId);
      emit(state.copyWith(
        isCreatingBusiness: false,
        businessList: _businesses,
        // business: currentBusinessEdit,
        filteredBusinessList: _businesses,
        currentEditBusiness: currentBusinessEdit,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingBusiness: false));
      onError('$_failure');
    }
  }

  Future<void> getUserPartnerRequest(
    int userId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingPartnerRequests: true));
    final _eitherFailureOrSuccess =
        await mainRepository.getUserPartnerRequest(userId);
    if (_eitherFailureOrSuccess.isRight()) {
      final _partnerReqs =
          _eitherFailureOrSuccess.fold((_) => null, (reqs) => reqs);
      emit(state.copyWith(
        isLoadingPartnerRequests: false,
        partnerRequestList: _partnerReqs,
        filteredPartnerRequestList: _partnerReqs,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingPartnerRequests: false));
      onError('$_failure');
    }
  }

  Future<void> deletePartnerRequest(
    int userId,
    int requestId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isDeletingPartnerRequest: true));
    final _eitherFailureOrSuccess =
        await mainRepository.deletePartnerRequest(userId, requestId);
    if (_eitherFailureOrSuccess.isRight()) {
      final _partnerReqs =
          _eitherFailureOrSuccess.fold((_) => null, (reqs) => reqs);
      emit(state.copyWith(
        isDeletingPartnerRequest: false,
        partnerRequestList: _partnerReqs,
        filteredPartnerRequestList: _partnerReqs,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isDeletingPartnerRequest: false));
      onError('$_failure');
    }
  }

  Future<void> makePartnerRequest(
    int userId,
    int ownerId,
    int businessId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isSendingPartnerRequest: true));
    final _eitherFailureOrSuccess =
        await mainRepository.makePartnerRequest(userId, ownerId, businessId);
    if (_eitherFailureOrSuccess.isRight()) {
      final _partnerReqs =
          _eitherFailureOrSuccess.fold((_) => null, (reqs) => reqs);
      emit(state.copyWith(
        isSendingPartnerRequest: false,
        partnerRequestList: _partnerReqs,
        filteredPartnerRequestList: _partnerReqs,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isSendingPartnerRequest: false));
      onError('$_failure');
    }
  }

  Future<void> acceptPartnerRequest(
    int userId,
    int requestId,
    int partnerUserId,
    int businessId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isAcceptingPartnerRequest: true));
    final _eitherFailureOrSuccess = await mainRepository.acceptPartnerRequest(
      userId,
      requestId,
      partnerUserId,
      businessId,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _partnerReqs =
          _eitherFailureOrSuccess.fold((_) => null, (reqs) => reqs);
      emit(state.copyWith(
        isAcceptingPartnerRequest: false,
        partnerRequestList: _partnerReqs,
        filteredPartnerRequestList: _partnerReqs,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isAcceptingPartnerRequest: false));
      onError('$_failure');
    }
  }

  Future<void> getBusinessWithOwnerByCode(
    String code, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingAvailablePartners: true));
    if (code.isNotEmpty && code != null) {
      final _eitherFailureOrSuccess =
          await mainRepository.getBusinessWithOwnerByCode(code);
      if (_eitherFailureOrSuccess.isRight()) {
        final _businessesUnfiltered = _eitherFailureOrSuccess.fold(
            (_) => null, (businesses) => businesses);
        final _businesses = _businessesUnfiltered.where((e) {
          for (var i in state.businessList) {
            if (i.businessId != e.businessId) {
              return true;
            } else {
              return false;
            }
          }
          return false;
        }).toList();
        emit(state.copyWith(
          isLoadingAvailablePartners: false,
          availablePartnerList: _businesses,
          filteredAvailablePartnerList: _businesses,
        ));
        onSuccess();
      } else {
        final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
        emit(state.copyWith(isLoadingAvailablePartners: false));
        onError('$_failure');
      }
    } else {
      emit(state.copyWith(isLoadingAvailablePartners: false));
    }
  }

  Future<void> getBusinessTransactions(
    int businessId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingTransactions: true));
    final _eitherFailureOrSaved =
        await mainRepository.getBusinessTransactions(businessId);
    if (_eitherFailureOrSaved.isRight()) {
      final _transaction =
          _eitherFailureOrSaved.fold((_) => null, (trans) => trans);
      emit(state.copyWith(
        isLoadingTransactions: false,
        transactionList: _transaction.reversed.toList(),
        filteredTransactionList: _transaction.reversed.toList(),
      ));
      onSuccess();
    } else {
      final failure = _eitherFailureOrSaved.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingTransactions: false));
      onError('$failure');
    }
  }

  Future<void> getBusinessUsers(
    int businessId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingBusinessUsers: true));
    final _eitherFailureOrSuccess =
        await mainRepository.getBusinessUsers(businessId);
    if (_eitherFailureOrSuccess.isRight()) {
      final _userList =
          _eitherFailureOrSuccess.fold((_) => null, (users) => users);
      emit(state.copyWith(
          isLoadingBusinessUsers: false,
          userList: _userList,
          filteredUserList: _userList));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingBusinessUsers: false));
      onError('$_failure');
    }
  }

  Future<void> addProductStocks(
    int businessId,
    int userId,
    int productId,
    String keyId,
    double productQuantity, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isAddingStocks: true));
    final _eitherFailureOrSuccess = await mainRepository.addProductStocks(
      businessId,
      userId,
      productId,
      keyId,
      productQuantity,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _product =
          _eitherFailureOrSuccess.fold((_) => null, (product) => product);
      emit(state.copyWith(isAddingStocks: false, activeStockProduct: _product));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isAddingStocks: false));
      onError('$_failure');
    }
  }

  Future<void> getProductStockMovements(
    int productId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingStockMovements: true));
    final _eitherFailureOrSuccess =
        await mainRepository.getProductStockMovements(
      productId,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _movements =
          _eitherFailureOrSuccess.fold((_) => null, (movement) => movement);
      emit(state.copyWith(
        isLoadingStockMovements: false,
        productStockMovementList: _movements,
        filteredStockMovementList: _movements,
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingStockMovements: false));
      onError('$_failure');
    }
  }

  Future<void> createBusinessUser(
    int businessId,
    String uID,
    String passWord,
    String fullName,
    String position,
    bool isActivatedCheckout,
    bool isActivatedProducts,
    bool isActivatedCustomers,
    bool isActivatedTransactions,
    bool isActivatedUsers,
    bool isActivatedCalendar,
    bool canMakeDiscounts, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingUser: true));
    final _eitherFailureOrSuccess = await mainRepository.createBusinessUser(
      businessId,
      uID: uID,
      passWord: passWord,
      fullName: fullName,
      position: position,
      isActivatedCheckout: isActivatedCheckout,
      isActivatedProducts: isActivatedProducts,
      isActivatedCustomers: isActivatedCustomers,
      isActivatedTransactions: isActivatedTransactions,
      isActivatedUsers: isActivatedUsers,
      isActivatedCalendar: isActivatedCalendar,
      canMakeDiscounts: canMakeDiscounts,
    );
    if (_eitherFailureOrSuccess.isRight()) {
      final _userList =
          _eitherFailureOrSuccess.fold((_) => null, (users) => users);
      emit(state.copyWith(
          isCreatingUser: false,
          userList: _userList,
          filteredUserList: _userList));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingUser: false));
      onError('$_failure');
    }
  }

  Future<void> createCustomer(
    int businessId,
    String customerName,
    String customerPhone,
    String customerEmail,
    String customerAddress, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingCustomer: true));
    final _eitherFailureOrCreated = await mainRepository.createCustomer(
      businessId,
      customerName,
      customerPhone,
      customerEmail,
      customerAddress,
      'N/A',
      state.user.userEmail,
    );
    if (_eitherFailureOrCreated.isRight()) {
      final _customers =
          _eitherFailureOrCreated.fold((_) => null, (customers) => customers);
      emit(state.copyWith(
          isCreatingCustomer: false,
          customerList: _customers,
          filteredCustomerList: _customers));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrCreated.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingCustomer: false));
      onError('$_failure');
    }
  }

  Future<void> getCustomers(
    int businessId, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingCustomers: true));
    final _eitherFailureOrCustomers =
        await mainRepository.getCustomers(businessId);
    if (_eitherFailureOrCustomers.isRight()) {
      final _customers =
          _eitherFailureOrCustomers.fold((_) => null, (customers) => customers);
      emit(state.copyWith(
          isLoadingCustomers: false,
          customerList: _customers,
          filteredCustomerList: _customers));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrCustomers.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingCustomers: false));
      onError('$_failure');
    }
  }

  Future<void> getBusinessCategories(
    int businessId, {
    Function(List<Category> categories) onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isLoadingCategories: true));
    final _eitherFailureOrCategories =
        await mainRepository.getCategoriesByBusinessId(businessId);
    if (_eitherFailureOrCategories.isRight()) {
      final _categoryList =
          _eitherFailureOrCategories.fold((_) => null, (list) => list);
      emit(state.copyWith(
        isLoadingCategories: false,
        categoryList: _categoryList
            .where((e) => e.isHidden.toLowerCase() == 'false')
            .toList(),
        filteredCategoryList: _categoryList
            .where((e) => e.isHidden.toLowerCase() == 'false')
            .toList(),
      ));
    } else {
      final failure = _eitherFailureOrCategories.fold((f) => f, (_) => null);
      emit(state.copyWith(isLoadingCategories: false));
      onError('$failure');
    }
  }

  Future<void> getBusinessProducts(
    int businessId, {
    Function(List<CategorizeProducts> categorizeProducts) onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isRetrievingProducts: true));

    final _eitherFailureOrProducts =
        await mainRepository.getBusinessProducts(businessId);
    if (_eitherFailureOrProducts.isRight()) {
      var _products =
          _eitherFailureOrProducts.fold((_) => null, (products) => products);
      var _prdcts = [
        Product(
          productId: 1,
          productName: 'Chocolate',
          productCode: 'ABCDEF',
          productCost: '10.00',
          productPrice: '20.00',
          productDescription: 'N/A',
          productBGColor: '#000000',
          productSoldBy: 'Unit',
          productCategory: 'Food',
          productQuantity: '10',
          productImage: '',
          isProductDeleted: 0,
          isProductHidden: 0,
          isProductOnline: 0,
        ),
        Product(
          productId: 1,
          productName: 'Lemon Juice',
          productCode: 'MNOPQ',
          productCost: '15.00',
          productPrice: '40.00',
          productDescription: 'N/A',
          productBGColor: '#FFFFFF',
          productSoldBy: 'Unit',
          productCategory: 'Drinks',
          productQuantity: '10',
          productImage: '',
          isProductDeleted: 0,
          isProductHidden: 0,
          isProductOnline: 0,
        ),
        Product(
          productId: 1,
          productName: 'Rice Meal',
          productCode: 'GHIKL',
          productCost: '10.00',
          productPrice: '20.00',
          productDescription: 'N/A',
          productBGColor: '#4a69bd',
          productSoldBy: 'Unit',
          productCategory: 'Food',
          productQuantity: '10',
          productImage: '',
          isProductDeleted: 0,
          isProductHidden: 0,
          isProductOnline: 0,
        ),
      ];

      final _dummyProducts = [
        CategorizeProducts(
          productCategory: 'All',
          productCount: 3,
          productDescription: 'N/A',
          products: _prdcts,
        ),
        CategorizeProducts(
          productCategory: 'Food',
          productCount: 2,
          productDescription: 'N/A',
          products: _prdcts.where((e) => e.productCategory == 'Food').toList(),
        ),
        CategorizeProducts(
          productCategory: 'Drinks',
          productCount: 1,
          productDescription: 'N/A',
          products:
              _prdcts.where((e) => e.productCategory == 'Drinks').toList(),
        ),
      ];

      if (_products.isEmpty) {}

      emit(state.copyWith(
        categorizedProducts: _products.isEmpty ? _dummyProducts : _products,
        productList: _products.isEmpty ? _dummyProducts : _products,
        filteredProductList: _products.isEmpty ? _dummyProducts : _products,
        allProductList: _products
            .where((e) => e.productCategory == 'All')
            .first
            .products
            .toList(),
        filteredAllProductList: _products
            .where((e) => e.productCategory == 'All')
            .first
            .products
            .toList(),
      ));
      emit(state.copyWith(isRetrievingProducts: false));
      onSuccess(_products);
    } else {
      final _failure = _eitherFailureOrProducts.fold((f) => f, (_) => null);
      print(_failure);
      emit(state.copyWith(isRetrievingProducts: false));
      onError('Something went wrong');
    }
  }

  Future<void> createProductCategory(
    int businessId,
    String categoryName,
    String createdBy, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingCategory: true));
    final _eitherFailureOrCreated = await mainRepository.createProductCategory(
      businessId,
      categoryName,
      createdBy,
    );
    if (_eitherFailureOrCreated.isRight()) {
      final _categories =
          _eitherFailureOrCreated.fold((_) => null, (list) => list);
      emit(state.copyWith(
          isCreatingCategory: false,
          categoryList: _categories,
          filteredCategoryList: _categories));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrCreated.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingCategory: false));
      onError('$_failure');
    }
  }

  void addProductToCart(Product p) {
    final isProductAddedAlready =
        state.curTransactionDetails.where((e) => e.keyId == p.keyId).toList();
    if (isProductAddedAlready.isNotEmpty) {
      final cartItem = state.curTransactionDetails[
          state.curTransactionDetails.indexWhere((e) => e.keyId == p.keyId)];
      final transactionDetail = TransactionDetail(
        productId: p.productId,
        keyId: p.keyId,
        productName: p.productName,
        productBGColor: p.productBGColor,
        productUint8ListImg: p.productUint8ListImg,
        productPrice: double.parse(p.productPrice),
        productCost: double.parse(p.productCost),
        quantity: cartItem.quantity + 1,
        totalAmount: ((cartItem.quantity * cartItem.productPrice) +
            double.parse(p.productPrice)),
        discountInCash: 0,
        discountInPercent: 0,
        isProductInventory: p.isProductInventory == 1 ? true : false,
        addedNotes: 'N/A',
      );
      state.curTransactionDetails.removeWhere((e) => e.keyId == cartItem.keyId);
      state.curTransactionDetails.add(transactionDetail);
    } else {
      state.curTransactionDetails.add(TransactionDetail(
        productId: p.productId,
        keyId: p.keyId,
        productName: p.productName,
        productBGColor: p.productBGColor,
        productUint8ListImg: p.productUint8ListImg,
        productPrice: double.parse(p.productPrice),
        productCost: double.parse(p.productCost),
        quantity: 1,
        totalAmount: double.parse(p.productPrice),
        discountInCash: 0,
        discountInPercent: 0,
        isProductInventory: p.isProductInventory == 1 ? true : false,
        addedNotes: 'N/A',
      ));
    }
    computeSubtotalAmount();
    computeTotalAmount();
  }

  void removeProductToCart(TransactionDetail t) {
    state.curTransactionDetails.removeWhere((e) => e.keyId == t.keyId);
    computeSubtotalAmount();
    computeTotalAmount();
  }

  void editProductCartQty(
      TransactionDetail transactionDetail, double quantity) {
    var currentProductIndex = state.curTransactionDetails
        .indexWhere((e) => e.keyId == transactionDetail.keyId);

    if (currentProductIndex >= 0) {
      state.curTransactionDetails[currentProductIndex] = TransactionDetail(
        productId: transactionDetail.productId,
        keyId: transactionDetail.keyId,
        productName: transactionDetail.productName,
        productUint8ListImg: transactionDetail.productUint8ListImg,
        productPrice: transactionDetail.productPrice,
        productBGColor: transactionDetail.productBGColor,
        productCost: transactionDetail.productCost,
        quantity: quantity,
        totalAmount: (transactionDetail.productPrice * quantity),
        discountInCash: 0,
        discountInPercent: 0,
        isProductInventory: transactionDetail.isProductInventory,
        addedNotes: transactionDetail.addedNotes,
      );
    }
    computeSubtotalAmount();
    computeTotalAmount();
  }

  void editProductCartDiscount(
    TransactionDetail transactionDetail,
    double inCash,
    double inPercent,
  ) {
    var currentProductIndex = state.curTransactionDetails
        .indexWhere((e) => e.keyId == transactionDetail.keyId);

    if (currentProductIndex >= 0) {
      state.curTransactionDetails[currentProductIndex] = TransactionDetail(
        productId: transactionDetail.productId,
        keyId: transactionDetail.keyId,
        productName: transactionDetail.productName,
        productUint8ListImg: transactionDetail.productUint8ListImg,
        productPrice: transactionDetail.productPrice,
        productBGColor: transactionDetail.productBGColor,
        productCost: transactionDetail.productCost,
        quantity: transactionDetail.quantity,
        totalAmount: ((transactionDetail.quantity *
                        transactionDetail.productPrice) -
                    inCash) <
                0
            ? 0
            : ((transactionDetail.quantity * transactionDetail.productPrice) -
                inCash),
        discountInCash: inCash,
        discountInPercent: inPercent,
        isProductInventory: transactionDetail.isProductInventory,
        addedNotes: transactionDetail.addedNotes,
      );
    }
    computeSubtotalAmount();
    computeTotalAmount();
  }

  Future<void> createProduct(
    int businessId,
    String productName,
    String productCategory,
    double productPrice,
    String productCode,
    double productCost,
    String productSoldBy,
    String productBGColor,
    String createdBy,
    Uint8List _img, {
    Function() onSuccess,
    Function(String msg) onError,
  }) async {
    emit(state.copyWith(isCreatingProduct: true));
    var base64Image = '';

    if (_img != null) {
      base64Image = base64.encode(_img);
    }

    final _eitherFailureOrCreated = await mainRepository.createProduct(
      businessId,
      productName,
      productCategory,
      productPrice,
      productCode,
      productCost,
      productSoldBy,
      productBGColor,
      createdBy,
      base64Image.isEmpty ? '' : '$base64Image',
      _img,
    );
    if (_eitherFailureOrCreated.isRight()) {
      final _products =
          _eitherFailureOrCreated.fold((_) => null, (prod) => prod);
      emit(state.copyWith(
        isCreatingProduct: false,
        categorizedProducts: _products,
        productList: _products,
        filteredProductList: _products,
        allProductList: _products
            .where((e) => e.productCategory == 'All')
            .first
            .products
            .toList(),
        filteredAllProductList: _products
            .where((e) => e.productCategory == 'All')
            .first
            .products
            .toList(),
      ));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrCreated.fold((f) => f, (_) => null);
      emit(state.copyWith(isCreatingProduct: false));
      onError('$_failure');
    }
  }

  Future<void> startListeningToBusinessMessages() async {
    emit(state.copyWith(isLoadingBusinessMessages: true));
    final querySnapshots = await businessChatRef
        .doc('business_chats')
        .collection('${state.business.businessId}')
        .orderBy('time_stamp', descending: true)
        .snapshots();
    await _businessMessageSubscription?.cancel();
    _businessMessageSubscription = querySnapshots.listen(
      (snap) {
        final messageList = snap.docs
            .map((e) => BusinessMessage(
                  userId: int.parse(e.data()['user_id']),
                  message: e.data()['message'],
                  senderFullName: e.data()['sender_fullname'],
                  timeStamp: e.data()['time_stamp'] == null
                      ? null
                      : e.data()['time_stamp'].toDate(),
                  isHiddenToCashier:
                      e.data()['is_hidden_to_cashiers'] == 'false'
                          ? false
                          : true,
                  status: e.data()['status'],
                  video: e.data()['video'],
                  photo: e.data()['photo'],
                  recievedBy: e.data()['recieved_by'],
                ))
            .toList();
        emit(state.copyWith(
          businessMessageList: messageList,
        ));
      },
      onError: (e) {
        emit(state.copyWith(isLoadingBusinessMessages: false));
      },
    );
  }

  Future<void> sendBusinessMessage(
    String message, {
    Function(String msg) onError,
    Function() onSuccess,
  }) async {
    emit(state.copyWith(isSendingBusinessMessage: true));
    final _eitherFailureOrSuccess = await mainRepository.sendBusinessMessage(
      state.business.businessId,
      BusinessMessage(
        userId: state.user.userId,
        message: message,
        senderFullName: state.user.fullName,
        chatMsgType: 'normal',
        isHiddenToCashier: false,
        status: 1,
      ),
    );

    if (_eitherFailureOrSuccess.isRight()) {
      final _docRef =
          _eitherFailureOrSuccess.fold((_) => null, (docRef) => docRef);
      emit(state.copyWith(isSendingBusinessMessage: true));
      onSuccess();
    } else {
      final _failure = _eitherFailureOrSuccess.fold((f) => f, (_) => null);
      emit(state.copyWith(isSendingBusinessMessage: true));
      onError('$_failure');
    }
  }

  void onBusinessSearch(String value) {
    emit(state.copyWith(
      filteredBusinessList: state.businessList
          .where((e) => e.businessName.toLowerCase().contains(value))
          .toList(),
    ));
  }

  void onProductSearch(String value) {
    emit(state.copyWith(
        filteredAllProductList: state.allProductList
            .where((e) => e.productName.toLowerCase().contains(value))
            .toList()));
  }

  void onUserSearch(String value) {
    emit(state.copyWith(
      filteredUserList: state.userList
          .where((e) =>
              e.fullName.toLowerCase().contains(value) ||
              e.uId.toLowerCase().contains(value) ||
              e.userEmail.toLowerCase().contains(value) ||
              e.status.toLowerCase().contains(value))
          .toList(),
    ));
  }

  void onCategorySearch(String value) {
    emit(state.copyWith(
        filteredCategoryList: state.categoryList
            .where((e) => e.categoryName.toLowerCase().contains(value))
            .toList()));
  }

  void onEditProductNameChanged(String value) {
    if (value.isEmpty) {
      emit(state.copyWith(
          editProductNameError: 'Cannot leave this field empty.'));
    } else {
      emit(state.copyWith(
        editProductName: value,
        editProductNameError: 'Cannot leave this field empty.',
      ));
    }
  }

  void onEditProductPriceChanged(String value) {
    var val = double.tryParse(value) ?? 0;
    emit(state.copyWith(editProductPrice: val));
  }

  void onEditProductCostChanged(String value) {
    var val = double.tryParse(value) ?? 0;
    emit(state.copyWith(editProductCost: val));
  }

  void onEditDescriptionChanged(String value) {
    emit(state.copyWith(editProductDescription: value));
  }

  void onEditCategoryChanged(String value) {
    // emit(state.cop)
  }

  void onCartItemQtyChanged(String value) {
    var storeNum = '';
    state.itemQuantityList.add(value);
    for (var i in state.itemQuantityList) {
      storeNum += i;
    }
    final inCents = double.parse(storeNum) / 100;
    final val =
        NumberFormat.currency(customPattern: '###,###.##', locale: 'en_PH')
            .format(inCents);
    print(val);
    emit(state.copyWith(itemQuantity: double.parse(val.replaceAll(',', ''))));
  }

  void onCartItemDiscountInCashChanged(String value) {
    final temVal = double.tryParse(value) ?? 0;
    final total = (state.cartItem.quantity * state.cartItem.productPrice);
    final percent = (100 * temVal) / total;
    emit(state.copyWith(
      itemDiscountInCash: temVal,
      itemDiscountInPercent: percent,
    ));
  }

  void onCartItemDiscountInPercentChanged(String value) {
    final temVal = double.tryParse(value) ?? 0;
    final total = (state.cartItem.quantity * state.cartItem.productPrice);
    final cash = total * (temVal / 100);
    emit(state.copyWith(
      itemDiscountInCash: cash,
      itemDiscountInPercent: temVal,
    ));
  }

  void setEditProduct(Product product) {
    emit(state.copyWith(productEdit: product));
  }

  void setActiveStockProduct(Product p) {
    emit(state.copyWith(activeStockProduct: p));
  }

  void setCartItemDiscounts(double cash, double percent) {
    emit(state.copyWith(
      itemDiscountInCash: cash,
      itemDiscountInPercent: percent,
    ));
  }

  void onStockAmountChanged(String value) {
    var storeNum = '';
    state.stockAmountList.add(value);
    for (var i in state.stockAmountList) {
      storeNum += i;
    }
    final inCents = double.parse(storeNum) / 100;
    final val =
        NumberFormat.currency(customPattern: '###,###.##', locale: 'en_PH')
            .format(inCents);
    emit(state.copyWith(stockAmount: double.parse(val.replaceAll(',', ''))));
  }

  void setStockAmount(double value) {
    emit(state.copyWith(stockAmount: value));
  }

  void setCartItemQty(double value) {
    emit(state.copyWith(itemQuantity: value));
  }

  void setCartItem(TransactionDetail transactionDetail) {
    emit(state.copyWith(cartItem: transactionDetail));
  }

  void setUser(User user) {
    emit(state.copyWith(user: user));
  }

  void setBusiness(Business business) {
    emit(state.copyWith(business: business));
  }

  void setEmailAndUids(List<EmailAndUidModel> emailAndUidList) {
    emit(state.copyWith(emailAndUidList: emailAndUidList));
  }

  void setTransaction(Transaction transaction) {
    emit(state.copyWith(currentTransaction: transaction));
  }

  void changePageState(String page) {
    emit(state.copyWith(curPage: page));
  }

  void onBusinessChatChanged(String value) {
    emit(state.copyWith(businessChatMessage: value));
  }

  void onTransactionNoteChanged(String value) {
    emit(state.copyWith(transactionNote: value));
  }

  void onTotalCashChanged(String value) {
    var storeNum = '';
    state.numericList.add(value);
    for (var i in state.numericList) {
      storeNum += i;
    }
    final inCents = double.parse(storeNum) / 100;
    final val =
        NumberFormat.currency(customPattern: '###,###.##', locale: 'en_PH')
            .format(inCents);
    emit(state.copyWith(totalCash: double.parse(val.replaceAll(',', ''))));
    computeChangeTotal();
  }

  void onCategoryNameChanged(String value) {
    emit(state.copyWith(categoryName: value));
  }

  /// User creation
  void onUIDChanged(String value) async {
    emit(state.copyWith(isCheckingUid: true));
    final _eitherLeftOrRight = await validator.isValidUID(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(uID: value, uIDError: ''));
      emit(state.copyWith(isCheckingUid: false));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(uID: value, uIDError: _failure));
      emit(state.copyWith(isCheckingUid: false));
    }
  }

  void onUsernameChanged(String value) {
    emit(state.copyWith(uID: value));
  }

  void onUserFullNameChanged(String value) {
    final _eitherLeftOrRight = validator.isValidFullName(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(userFullName: value, userFullNameError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(userFullName: value, userFullNameError: _failure));
    }
  }

  void onUserPasswordChanged(String value) {
    final _eitherLeftOrRight = validator.isValidPassword(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(userPassword: value, userPasswordError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(userPassword: value, userPasswordError: _failure));
    }
  }

  void onUserPositionChanged(String value) {
    final _eitherLeftOrRight = validator.isEmpty(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(userPosition: value, userPositionError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(userPosition: value, userPositionError: _failure));
    }
  }

  void checkPrevileges() {
    if (!state.isActivatedCheckout &&
        !state.isActivatedProducts &&
        !state.isActivatedCustomers &&
        !state.isActivatedTransactions &&
        !state.isActivatedUsers &&
        !state.isActivatedCalendar) {
      emit(state.copyWith(
          previlegeError: 'You need to activate at least 1 previlege.'));
    }
  }

  void setActiveBusinessStatus(bool val) {
    emit(state.copyWith(isBusinessActive: val));
  }

  void setCurrentEditBusiness(Business business) {
    emit(state.copyWith(currentEditBusiness: business));
  }

  void setTotalCash(String numericString) {
    cashInitial();
    emit(state.copyWith(totalCash: double.parse(numericString)));
    computeChangeTotal();
  }

  void setAnalyticDates(DateTime from, DateTime to) async {
    emit(state.copyWith(analyticFromDate: from, analyticToDate: to));
    await getStatistics(
      state.business.businessId,
      '${DateFormat('yyyy-MM-dd').format(state.analyticFromDate).toString()} 00:00:00',
      '${DateFormat('yyyy-MM-dd').format(state.analyticToDate).toString()} 23:59:00',
      onSuccess: () {},
      onError: (msg) {},
    );
  }

  void setCheckoutStatus(bool val) {
    emit(state.copyWith(isActivatedCheckout: val));
    checkPrevileges();
  }

  void setProductStatus(bool val) {
    emit(state.copyWith(isActivatedProducts: val));
    checkPrevileges();
  }

  void setCustomerStatus(bool val) {
    emit(state.copyWith(isActivatedCustomers: val));
    checkPrevileges();
  }

  void setTransactionStatus(bool val) {
    emit(state.copyWith(isActivatedTransactions: val));
    checkPrevileges();
  }

  void setUserStatus(bool val) {
    emit(state.copyWith(isActivatedUsers: val));
    checkPrevileges();
  }

  void setCalendarStatus(bool val) {
    emit(state.copyWith(isActivatedCalendar: val));
    checkPrevileges();
  }

  void setMakeDiscountStatus(bool val) {
    emit(state.copyWith(canMakeDiscounts: val));
    checkPrevileges();
  }

  void newUserInitial() {
    emit(state.copyWith(
      uID: '',
      userPassword: '',
      userFullName: '',
      userPosition: '',
      isActivatedCheckout: false,
      isActivatedProducts: false,
      isActivatedTransactions: false,
      isActivatedCustomers: false,
      isActivatedUsers: false,
      isActivatedCalendar: false,
      canMakeDiscounts: false,
    ));
  }

  /// Business Creation
  void onBusinessNameChanged(String value) {
    final _eitherLeftOrRight = validator.isEmpty(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(businessName: value, businessNameError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(businessName: value, businessNameError: _failure));
    }
  }

  void onBusinessPhoneChanged(String value) {
    final _eitherLeftOrRight = validator.isEmpty(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(businessPhone: value, businessPhoneError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(businessPhone: value, businessPhoneError: _failure));
    }
  }

  void onBusinessAddressChanged(String value) {
    final _eitherLeftOrRight = validator.isEmpty(value);
    if (_eitherLeftOrRight.isRight()) {
      emit(state.copyWith(businessAddress: value, businessAddressError: ''));
    } else {
      final _failure = _eitherLeftOrRight.fold((f) => f, (_) => null);
      emit(state.copyWith(
          businessAddress: value, businessAddressError: _failure));
    }
  }

  void stockAmountInitial() {
    emit(state.copyWith(stockAmountList: []));
  }

  void cartItemQtyInitial() {
    emit(state.copyWith(itemQuantityList: []));
  }

  void editBusinessInitial() {
    emit(state.copyWith(
      isLoadingBusinesses: false,
      isCreatingBusiness: false,
      isBusinessActive: true,
      businessName: state.currentEditBusiness.businessName,
      businessNameError: '',
      businessPhone: state.currentEditBusiness.businessPhone,
      businessPhoneError: '',
      businessAddress: state.currentEditBusiness.businessAddress1,
      businessAddressError: '',
    ));
  }

  void businessInitial() {
    emit(state.copyWith(
      isLoadingBusinesses: false,
      isCreatingBusiness: false,
      isBusinessActive: true,
      businessName: '',
      businessNameError: 'This field cannot be empty',
      businessPhone: '',
      businessPhoneError: 'This field cannot be empty',
      businessAddress: '',
      businessAddressError: 'This field cannot be empty',
    ));
  }

  /// [PARTNER]
  void partnerInitial() {
    emit(state.copyWith(
      businessCode: '',
      isLoadingAvailablePartners: false,
      availablePartnerList: [],
      filteredAvailablePartnerList: [],
    ));
  }

  void onPartnerBusinessCodeChanged(String value) {
    emit(state.copyWith(businessCode: value));
  }

  /// Product Creation
  void onProductNameChanged(String value) {
    emit(state.copyWith(productName: value));
  }

  void onProductPriceChanged(String value) {
    emit(state.copyWith(productPrice: double.parse(value)));
  }

  void onProductDescriptionChanged(String value) {
    emit(state.copyWith(productDescription: value));
  }

  void onProductCategoryChanged(String value) {
    emit(state.copyWith(productCategory: value));
  }

  void onProductCodeChanged(String value) {
    emit(state.copyWith(productCode: value));
  }

  void onProductCostChanged(String value) {
    emit(state.copyWith(productCost: double.parse(value)));
  }

  // Customer creation
  void onCustomerNameChanged(String value) {
    emit(state.copyWith(customerName: value));
  }

  void onCustomerPhoneChanged(String value) {
    emit(state.copyWith(customerPhone: value));
  }

  void onCustomerEmailChanged(String value) {
    emit(state.copyWith(customerEmail: value));
  }

  void onCustomerAddressChanged(String value) {
    emit(state.copyWith(customerAddress: value));
  }

  /// Customer
  void onCustomerSearch(String value) {
    emit(
      state.copyWith(
          filteredCustomerList: state.customerList
              .where((e) => e.customerName.toLowerCase().contains(value))
              .toList()),
    );
  }

  void setCustomer(Customer cus) {
    emit(state.copyWith(customer: cus));
  }

  void removeCustomer() {
    emit(state.copyWith(customer: null));
  }

  /// Computations

  void onDiscountInPercentChanged(String value) {
    var sumTemp = 0.0;
    if (value.isEmpty) {
      emit(state.copyWith(discountInPercent: 0));
    } else {
      emit(state.copyWith(discountInPercent: double.parse(value)));
    }
    sumTemp = (state.discountInPercent * state.subtotalAmount / 100);
    emit(state.copyWith(discountInAmount: sumTemp));
    computeTotalAmount();
  }

  void onDiscountInAmountChanged(String value) {
    var sumTemp = 0.0;
    if (value.isEmpty) {
      emit(state.copyWith(discountInAmount: 0));
    } else {
      emit(state.copyWith(discountInAmount: double.parse(value)));
    }
    sumTemp = (state.discountInAmount / state.subtotalAmount * 100);
    emit(state.copyWith(discountInPercent: sumTemp));
    computeTotalAmount();
  }

  void computeChangeTotal() {
    final _sumChange = state.totalCash - state.totalAmount;
    emit(state.copyWith(totalChange: _sumChange));
  }

  void computeSubtotalAmount() {
    var sumTemp = 0.0;
    for (var tDetail in state.curTransactionDetails) {
      sumTemp += tDetail.totalAmount;
    }
    emit(state.copyWith(subtotalAmount: sumTemp));
  }

  void computeTotalAmount() {
    var sumTemp = 0.0;
    for (var tDetail in state.curTransactionDetails) {
      sumTemp += tDetail.totalAmount;
    }
    if (state.discountInAmount > 0) {
      sumTemp -= state.discountInAmount;
    }
    emit(state.copyWith(totalAmount: sumTemp));
  }

  void setProductBGColor(String hexColor) {
    emit(state.copyWith(productBGColor: hexColor));
  }

  void setPage(String value) {
    emit(state.copyWith(curPage: value));
  }

  void setSelectedCartItemIndex(int index) {
    emit(state.copyWith(selectedCartItemIndex: index));
  }

  void removeLast() {
    emit(state.copyWith());
  }

  void selectedCartItemIndexInitial() {
    emit(state.copyWith(selectedCartItemIndex: -1));
  }

  void businessChatInitial() {
    emit(state.copyWith(businessChatMessage: ''));
  }

  void cartItemDiscountsInitial() {
    emit(state.copyWith(
      itemDiscountInCash: 0,
      itemDiscountInPercent: 0,
    ));
  }

  void cashInitial() {
    emit(state.copyWith(
      totalCash: 0,
      numericList: [],
      numericCash: '0',
    ));
    computeChangeTotal();
  }

  void payInitial() {
    emit(state.copyWith(totalCash: 0, totalChange: 0));
  }

  void checkoutInitial() {
    emit(state.copyWith(
      totalAmount: 0,
      totalChange: 0,
      totalCash: 0,
      numericList: [],
      subtotalAmount: 0,
      transactionNote: '',
      discountInAmount: 0,
      discountInPercent: 0,
      curPage: 'checkout',
      isSavingTransaction: false,
      isLoadingTransactions: false,
    ));
  }

  void productInitial() {
    emit(state.copyWith(
      productName: '',
      productPrice: 0,
      productReducedPrice: 0,
      productBGColor: '#1C3044',
      productCategory: '',
      productDescription: '',
      productCode: '',
      productCost: 0,
      productSoldBy: 'Unit',
    ));
  }

  void clearCart() {
    emit(state.copyWith(
      selectedCartItemIndex: -1,
      currentTransaction: Transaction(),
      curTransactionDetails: [],
      totalAmount: 0,
      totalChange: 0,
      totalCash: 0,
      numericCash: '0',
      numericList: [],
      subtotalAmount: 0,
      transactionNote: '',
      discountInAmount: 0,
      discountInPercent: 0,
      curPage: 'checkout',
      isSavingTransaction: false,
      isLoadingTransactions: false,
      customer: null,
    ));
  }

  void discountInitial() {
    emit(state.copyWith(
      discountInAmount: 0,
      discountInPercent: 0,
    ));
    computeSubtotalAmount();
    computeTotalAmount();
  }

  void notesInitial() {
    emit(state.copyWith(transactionNote: ''));
  }

  void customerInitial() {
    emit(state.copyWith(
      customerName: '',
      customerPhone: '',
      customerAddress: '',
      customerEmail: '',
      customerImage: '',
    ));
  }

  void mainInitial() {
    emit(state.copyWith(
      isRetrievingProducts: false,
      isLoadingEverything: false,
      isLoadingEmailAndUids: false,
      currentTransaction: Transaction(),
      emailAndUidList: [],
      categorizedProducts: [],
      productList: [],
      allProductList: [],
      filteredAllProductList: [],
      filteredProductList: [],
      curTransactionDetails: [],
      currency: 'P',

      /// Users
      user: User(),
      userList: [],
      filteredUserList: [],
      isCreatingUser: false,
      isLoadingBusinessUsers: false,

      /// New User
      isCheckingUid: false,
      uID: '',
      uIDError: 'Cannot be empty.',
      userPassword: '',
      userPasswordError: 'Password must be at least 6 characters.',
      userFullName: '',
      userFullNameError: 'Cannot be empty.',
      userPosition: '',
      userPositionError: 'Cannot be empty.',
      previlegeError: '',
      isActivatedCheckout: false,
      isActivatedProducts: false,
      isActivatedTransactions: false,
      isActivatedCustomers: false,
      isActivatedUsers: false,
      isActivatedCalendar: false,
      canMakeDiscounts: false,

      // Customers
      customerName: 'Jubla@Customer',
      customerPhone: 'N/A',
      customerAddress: 'N/A',
      customerEmail: 'N/A',
      customerImage: 'N/A',
      customerList: [],
      filteredCustomerList: [],
      isCreatingCustomer: false,
      isLoadingCustomers: false,

      ///Categories
      isCreatingCategory: false,
      isLoadingCategories: false,
      categoryList: [],
      filteredCategoryList: [],
      categoryName: '',

      /// Transactions
      transactionList: [],
      filteredTransactionList: [],

      /// Checkout
      totalAmount: 0,
      totalChange: 0,
      totalCash: 0,
      numericCash: '0',
      numericList: [],
      subtotalAmount: 0,
      transactionNote: '',
      discountInAmount: 0,
      discountInPercent: 0,
      curPage: 'checkout',
      isSavingTransaction: false,
      isLoadingTransactions: false,
      customer: null,

      /// Product
      productName: '',
      productPrice: 0,
      productReducedPrice: 0,
      productCategory: '',
      productDescription: '',
      productCode: '',
      productCost: 0,
      productSoldBy: 'Unit',
      productBGColor: '#1C3044',
      productImage: '',
      isCreatingProduct: false,

      /// Business
      business: Business(),
      currentEditBusiness: Business(),
      businessList: [],
      filteredBusinessList: [],
      isLoadingBusinesses: false,
      isCreatingBusiness: false,
      businessName: '',
      businessNameError: 'This field cannot be empty',
      businessPhone: '',
      businessPhoneError: 'This field cannot be empty',
      businessAddress: '',
      businessAddressError: 'This field cannot be empty',
      isBusinessActive: true,

      /// [Partners]
      businessCode: '',
      isLoadingAvailablePartners: false,
      availablePartnerList: [],
      filteredAvailablePartnerList: [],

      /// [Partner request]
      isSendingPartnerRequest: false,
      isAcceptingPartnerRequest: false,
      isLoadingPartnerRequests: false,
      isDeletingPartnerRequest: false,
      partnerRequestList: [],
      filteredPartnerRequestList: [],

      /// Statistics
      businessStatistic: BusinessStatistic(),
      isLoadingStatistics: false,
      analyticFromDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),
      analyticToDate: DateTime(
          DateTime.now().year, DateTime.now().month, DateTime.now().day),

      /// Firebase
      isLoadingBusinessMessages: false,
      isSendingBusinessMessage: false,
      businessChatMessage: '',
      businessMessageList: [],
    ));
  }

  @override
  Future<void> close() {
    _businessMessageSubscription?.cancel();
    return super.close();
  }
}
