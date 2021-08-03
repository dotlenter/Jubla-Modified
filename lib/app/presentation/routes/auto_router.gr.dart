// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../domain/entities/User/User.dart';
import '../ui/analytics_view/analytics_view.dart';
import '../ui/business_view/add_business_view/add_business_view.dart';
import '../ui/business_view/add_partner_view/add_partner_view.dart';
import '../ui/business_view/business_partner_view/business_partner_view.dart';
import '../ui/business_view/business_view.dart';
import '../ui/business_view/edit_business_view/edit_business_view.dart';
import '../ui/business_view/input_business_qr_view/input_business_qr_view.dart';
import '../ui/business_view/qr_code_scanner_view/business_code_scanner_view.dart';
import '../ui/calendar_view/calendar_view.dart';
import '../ui/category_views/add_category_view/add_category_view.dart';
import '../ui/category_views/category_view.dart';
import '../ui/checkout_views/add_customer_cart_view/add_customer_cart_view.dart';
import '../ui/checkout_views/add_discount_view/add_discount_view.dart';
import '../ui/checkout_views/add_notes_view/add_notes_view.dart';
import '../ui/checkout_views/cart_view/cart_view.dart';
import '../ui/checkout_views/checkout_view.dart';
import '../ui/checkout_views/edit_cart_discount_view/edit_cart_discount_view.dart';
import '../ui/checkout_views/edit_cart_quantity_view/edit_cart_quantity_view.dart';
import '../ui/customer_views/add_customer_view/add_customer_view.dart';
import '../ui/customer_views/customer_view.dart';
import '../ui/group_business_chat_view/group_business_chat_view.dart';
import '../ui/help_view/help_view.dart';
import '../ui/login_view/login_view.dart';
import '../ui/pay_view/amount_input_view/amount_input_view.dart';
import '../ui/pay_view/pay_view.dart';
import '../ui/products_view/add_product_view/add_product_view.dart';
import '../ui/products_view/add_stocks_view/add_stocks_view.dart';
import '../ui/products_view/edit_product_view/edit_product_view.dart';
import '../ui/products_view/input_stock_amount_view/input_stock_amount_view.dart';
import '../ui/products_view/products_view.dart';
import '../ui/products_view/stock_movements_view/stock_movements_view.dart';
import '../ui/profile_settings_view/profile_settings_view.dart';
import '../ui/qr_generate_view/qr_generate_view.dart';
import '../ui/registration_view/registration_view.dart';
import '../ui/settings_view/settings_view.dart';
import '../ui/splash_view/splash_view.dart';
import '../ui/take_picture_view/take_picture_view.dart';
import '../ui/transaction_complete_view/transaction_complete_view.dart';
import '../ui/transactions_view/transaction_view.dart';
import '../ui/users_view/add_user_view/add_user_view.dart';
import '../ui/users_view/users_view.dart';

class Routes {
  static const String splashView = '/';
  static const String loginView = '/login-view';
  static const String registrationView = '/registration-view';
  static const String cartView = '/cart-view';
  static const String addNotesView = '/add-notes-view';
  static const String addDiscountView = '/add-discount-view';
  static const String checkoutView = '/checkout-view';
  static const String productsView = '/products-view';
  static const String addProductView = '/add-product-view';
  static const String editProductView = '/edit-product-view';
  static const String categoryView = '/category-view';
  static const String addCategoryView = '/add-category-view';
  static const String customerView = '/customer-view';
  static const String addCustomerView = '/add-customer-view';
  static const String addCustomerCartView = '/add-customer-cart-view';
  static const String takePictureView = '/take-picture-view';
  static const String payView = '/pay-view';
  static const String transactionsView = '/transactions-view';
  static const String transactionCompleteView = '/transaction-complete-view';
  static const String usersView = '/users-view';
  static const String addUserView = '/add-user-view';
  static const String settingsView = '/settings-view';
  static const String helpView = '/help-view';
  static const String calendarView = '/calendar-view';
  static const String businessView = '/business-view';
  static const String addBusinessView = '/add-business-view';
  static const String analyticsView = '/analytics-view';
  static const String amountInputView = '/amount-input-view';
  static const String editBusinessView = '/edit-business-view';
  static const String addPartnerView = '/add-partner-view';
  static const String businessPartnerView = '/business-partner-view';
  static const String qrGenerateView = '/qr-generate-view';
  static const String businessCodeScannerView = '/business-code-scanner-view';
  static const String editCartQuantityView = '/edit-cart-quantity-view';
  static const String groupBusinessChatView = '/group-business-chat-view';
  static const String inputBusinenssQRView = '/input-businenss-qr-view';
  static const String profileSettingsView = '/profile-settings-view';
  static const String editCartDiscountView = '/edit-cart-discount-view';
  static const String addStocksView = '/add-stocks-view';
  static const String inputStockAmountView = '/input-stock-amount-view';
  static const String stockMovementsView = '/stock-movements-view';
  static const all = <String>{
    splashView,
    loginView,
    registrationView,
    cartView,
    addNotesView,
    addDiscountView,
    checkoutView,
    productsView,
    addProductView,
    editProductView,
    categoryView,
    addCategoryView,
    customerView,
    addCustomerView,
    addCustomerCartView,
    takePictureView,
    payView,
    transactionsView,
    transactionCompleteView,
    usersView,
    addUserView,
    settingsView,
    helpView,
    calendarView,
    businessView,
    addBusinessView,
    analyticsView,
    amountInputView,
    editBusinessView,
    addPartnerView,
    businessPartnerView,
    qrGenerateView,
    businessCodeScannerView,
    editCartQuantityView,
    groupBusinessChatView,
    inputBusinenssQRView,
    profileSettingsView,
    editCartDiscountView,
    addStocksView,
    inputStockAmountView,
    stockMovementsView,
  };
}

class AutoRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.splashView, page: SplashView),
    RouteDef(Routes.loginView, page: LoginView),
    RouteDef(Routes.registrationView, page: RegistrationView),
    RouteDef(Routes.cartView, page: CartView),
    RouteDef(Routes.addNotesView, page: AddNotesView),
    RouteDef(Routes.addDiscountView, page: AddDiscountView),
    RouteDef(Routes.checkoutView, page: CheckoutView),
    RouteDef(Routes.productsView, page: ProductsView),
    RouteDef(Routes.addProductView, page: AddProductView),
    RouteDef(Routes.editProductView, page: EditProductView),
    RouteDef(Routes.categoryView, page: CategoryView),
    RouteDef(Routes.addCategoryView, page: AddCategoryView),
    RouteDef(Routes.customerView, page: CustomerView),
    RouteDef(Routes.addCustomerView, page: AddCustomerView),
    RouteDef(Routes.addCustomerCartView, page: AddCustomerCartView),
    RouteDef(Routes.takePictureView, page: TakePictureView),
    RouteDef(Routes.payView, page: PayView),
    RouteDef(Routes.transactionsView, page: TransactionsView),
    RouteDef(Routes.transactionCompleteView, page: TransactionCompleteView),
    RouteDef(Routes.usersView, page: UsersView),
    RouteDef(Routes.addUserView, page: AddUserView),
    RouteDef(Routes.settingsView, page: SettingsView),
    RouteDef(Routes.helpView, page: HelpView),
    RouteDef(Routes.calendarView, page: CalendarView),
    RouteDef(Routes.businessView, page: BusinessView),
    RouteDef(Routes.addBusinessView, page: AddBusinessView),
    RouteDef(Routes.analyticsView, page: AnalyticsView),
    RouteDef(Routes.amountInputView, page: AmountInputView),
    RouteDef(Routes.editBusinessView, page: EditBusinessView),
    RouteDef(Routes.addPartnerView, page: AddPartnerView),
    RouteDef(Routes.businessPartnerView, page: BusinessPartnerView),
    RouteDef(Routes.qrGenerateView, page: QrGenerateView),
    RouteDef(Routes.businessCodeScannerView, page: BusinessCodeScannerView),
    RouteDef(Routes.editCartQuantityView, page: EditCartQuantityView),
    RouteDef(Routes.groupBusinessChatView, page: GroupBusinessChatView),
    RouteDef(Routes.inputBusinenssQRView, page: InputBusinenssQRView),
    RouteDef(Routes.profileSettingsView, page: ProfileSettingsView),
    RouteDef(Routes.editCartDiscountView, page: EditCartDiscountView),
    RouteDef(Routes.addStocksView, page: AddStocksView),
    RouteDef(Routes.inputStockAmountView, page: InputStockAmountView),
    RouteDef(Routes.stockMovementsView, page: StockMovementsView),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    SplashView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SplashView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
      );
    },
    LoginView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => LoginView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    RegistrationView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            RegistrationView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    CartView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => CartView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddNotesView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AddNotesView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddDiscountView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddDiscountView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    CheckoutView: (data) {
      final args = data.getArgs<CheckoutViewArguments>(
        orElse: () => CheckoutViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => CheckoutView(
          key: args.key,
          user: args.user,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    ProductsView: (data) {
      final args = data.getArgs<ProductsViewArguments>(
        orElse: () => ProductsViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => ProductsView(
          key: args.key,
          user: args.user,
          isQuickAccess: args.isQuickAccess,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddProductView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddProductView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    EditProductView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const EditProductView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    CategoryView: (data) {
      final args = data.getArgs<CategoryViewArguments>(
        orElse: () => CategoryViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => CategoryView(
          key: args.key,
          onSelectedCategoryChanged: args.onSelectedCategoryChanged,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddCategoryView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const AddCategoryView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    CustomerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => CustomerView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddCustomerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddCustomerView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddCustomerCartView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddCustomerCartView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    TakePictureView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TakePictureView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    PayView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => PayView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    TransactionsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TransactionsView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    TransactionCompleteView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            TransactionCompleteView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    UsersView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => UsersView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddUserView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => AddUserView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    SettingsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => SettingsView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    HelpView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => HelpView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    CalendarView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => CalendarView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    BusinessView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => BusinessView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddBusinessView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddBusinessView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AnalyticsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AnalyticsView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AmountInputView: (data) {
      final args = data.getArgs<AmountInputViewArguments>(
        orElse: () => AmountInputViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AmountInputView(
          key: args.key,
          paymentMethod: args.paymentMethod,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    EditBusinessView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EditBusinessView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddPartnerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddPartnerView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    BusinessPartnerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BusinessPartnerView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    QrGenerateView: (data) {
      final args = data.getArgs<QrGenerateViewArguments>(
        orElse: () => QrGenerateViewArguments(),
      );
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) => QrGenerateView(
          key: args.key,
          qrData: args.qrData,
        ),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    BusinessCodeScannerView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            BusinessCodeScannerView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    EditCartQuantityView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EditCartQuantityView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    GroupBusinessChatView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            GroupBusinessChatView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    InputBusinenssQRView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            InputBusinenssQRView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    ProfileSettingsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            ProfileSettingsView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    EditCartDiscountView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            EditCartDiscountView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    AddStocksView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            AddStocksView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    InputStockAmountView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            InputStockAmountView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
    StockMovementsView: (data) {
      return PageRouteBuilder<dynamic>(
        pageBuilder: (context, animation, secondaryAnimation) =>
            StockMovementsView(),
        settings: data,
        transitionsBuilder: TransitionsBuilders.fadeIn,
        transitionDuration: const Duration(milliseconds: 100),
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// CheckoutView arguments holder class
class CheckoutViewArguments {
  final Key key;
  final User user;
  CheckoutViewArguments({this.key, this.user});
}

/// ProductsView arguments holder class
class ProductsViewArguments {
  final Key key;
  final User user;
  final bool isQuickAccess;
  ProductsViewArguments({this.key, this.user, this.isQuickAccess = false});
}

/// CategoryView arguments holder class
class CategoryViewArguments {
  final Key key;
  final dynamic Function(String) onSelectedCategoryChanged;
  CategoryViewArguments({this.key, this.onSelectedCategoryChanged});
}

/// AmountInputView arguments holder class
class AmountInputViewArguments {
  final Key key;
  final String paymentMethod;
  AmountInputViewArguments({this.key, this.paymentMethod});
}

/// QrGenerateView arguments holder class
class QrGenerateViewArguments {
  final Key key;
  final String qrData;
  QrGenerateViewArguments({this.key, this.qrData});
}
