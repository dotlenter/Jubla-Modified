part of 'main_cubit.dart';

@freezed
abstract class MainState with _$MainState {
  const factory MainState({
    /// Lists, Settings, and ETC.
    @required bool isRetrievingProducts,
    @required bool isLoadingEverything,
    @required bool isLoadingEmailAndUids,
    @required List<EmailAndUidModel> emailAndUidList,
    @required List<CategorizeProducts> categorizedProducts,
    @required List<CategorizeProducts> productList,
    @required List<CategorizeProducts> filteredProductList,
    @required List<Product> allProductList,
    @required List<Product> filteredAllProductList,
    @required List<Transaction> transactionList,
    @required List<Transaction> filteredTransactionList,
    @required String currency,
    @required int selectedCartItemIndex,

    /// Category
    @required bool isCreatingCategory,
    @required bool isLoadingCategories,
    @required List<Category> categoryList,
    @required List<Category> filteredCategoryList,
    @required String categoryName,

    /// User
    @required User user,
    @required List<User> userList,
    @required List<User> filteredUserList,
    @required bool isCreatingUser,
    @required bool isLoadingBusinessUsers,

    /// New User
    @required bool isCheckingUid,
    @required String uID,
    @required String uIDError,
    @required String userFullName,
    @required String userFullNameError,
    @required String userPassword,
    @required String userPasswordError,
    @required String userPosition,
    @required String userPositionError,
    @required String previlegeError,
    @required bool isActivatedCheckout,
    @required bool isActivatedProducts,
    @required bool isActivatedCustomers,
    @required bool isActivatedTransactions,
    @required bool isActivatedUsers,
    @required bool isActivatedCalendar,

    /// Customers
    @required String customerName,
    @required String customerPhone,
    @required String customerAddress,
    @required String customerEmail,
    @required String customerImage,
    @required List<Customer> customerList,
    @required List<Customer> filteredCustomerList,
    @required bool isCreatingCustomer,
    @required bool isLoadingCustomers,
    @required bool canMakeDiscounts,

    /// Transaction
    @required double totalAmount,
    @required double totalChange,
    @required double totalCash,
    @required double subtotalAmount,
    @required String transactionNote,
    @required String numericCash,
    @required List<String> numericList,
    @required double discountInAmount,
    @required double discountInPercent,
    @required bool isSavingTransaction,
    @required bool isLoadingTransactions,
    Customer customer,
    @required Transaction currentTransaction,
    @required List<TransactionDetail> curTransactionDetails,

    /// SPA Transitions
    @required String curPage,

    /// Product
    @required String productName,
    @required double productPrice,
    @required double productReducedPrice,
    @required String productCategory,
    @required String productDescription,
    @required String productCode,
    @required double productCost,
    @required String productSoldBy,
    @required String productBGColor,
    @required String productImage,
    @required bool isCreatingProduct,

    /// [Extension] Product - Editing
    @required Product productEdit,
    @required bool isUpdatingProduct,
    @required String editProductName,
    @required double editProductPrice,
    @required double editProductReducedPrice,
    @required String editProductCategory,
    @required String editProductDescription,
    @required String editProductCode,
    @required double editProductCost,
    @required String editProductSoldBy,
    @required String editProductBGColor,
    @required String editProductImage,

    /// Updating Validation
    @required String editProductNameError,
    @required String editProductPriceError,
    @required String editProductReducedPriceError,
    @required String editProductCategoryError,
    @required String editProductDescriptionError,
    @required String editProductCodeError,
    @required String editProductCostError,
    @required String editProductSoldByError,
    @required String editProductBGColorError,
    @required String editProductImageError,

    /// Stocks and Edits
    @required Product activeStockProduct,
    @required bool isAddingStocks,
    @required bool isLoadingStockMovements,
    @required double minimumQty,
    @required double stockAmount,
    @required List<String> stockAmountList,
    @required List<StockMovement> productStockMovementList,
    @required List<StockMovement> filteredStockMovementList,

    /// Business
    @required Business business,
    @required Business currentEditBusiness,
    @required List<Business> businessList,
    @required List<Business> filteredBusinessList,
    @required bool isLoadingBusinesses,
    @required bool isCreatingBusiness,
    @required String businessName,
    @required String businessNameError,
    @required String businessPhone,
    @required String businessPhoneError,
    @required String businessAddress,
    @required String businessAddressError,
    @required bool isBusinessActive,

    /// [Partners]
    @required String businessCode,
    @required bool isLoadingAvailablePartners,
    @required List<Business> availablePartnerList,
    @required List<Business> filteredAvailablePartnerList,

    /// [Partner requests]
    @required bool isLoadingPartnerRequests,
    @required bool isDeletingPartnerRequest,
    @required bool isSendingPartnerRequest,
    @required bool isAcceptingPartnerRequest,
    @required List<PartnerRequest> partnerRequestList,
    @required List<PartnerRequest> filteredPartnerRequestList,

    /// Statistics
    @required BusinessStatistic businessStatistic,
    @required bool isLoadingStatistics,
    @required DateTime analyticFromDate,
    @required DateTime analyticToDate,

    /// Cart
    @required double itemQuantity,
    @required double customPrice,
    @required String itemNote,
    @required TransactionDetail cartItem,
    @required double itemDiscountInCash,
    @required double itemDiscountInPercent,
    @required List<String> itemQuantityList,

    /// Firebase
    @required bool isSendingBusinessMessage,
    @required bool isLoadingBusinessMessages,
    @required String businessChatMessage,
    @required List<BusinessMessage> businessMessageList,
    // cFirestore.QuerySnapshot businessMsgSnap,
  }) = _MainState;

  factory MainState.initial() => MainState(
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
        selectedCartItemIndex: -1,

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

        /// [Extension] product editing
        productEdit: Product(),
        isUpdatingProduct: false,
        editProductName: '',
        editProductPrice: 0,
        editProductReducedPrice: 0,
        editProductCategory: '',
        editProductDescription: '',
        editProductCode: '',
        editProductCost: 0,
        editProductSoldBy: '',
        editProductBGColor: '',
        editProductImage: '',

        /// product editing validations
        editProductNameError: 'Cannot leave this field blank.',
        editProductPriceError: 'Invalid price',
        editProductReducedPriceError: 'Invalid Price',
        editProductCategoryError: 'Cannot leave category blank.',
        editProductDescriptionError: 'Cannot leave description empty.',
        editProductCodeError: '',
        editProductCostError: 'Invalid Cost value.',
        editProductSoldByError: '',
        editProductBGColorError: '',
        editProductImageError: '',

        /// Product Add Stocks
        activeStockProduct: Product(),
        minimumQty: 0,
        isAddingStocks: false,
        isLoadingStockMovements: false,
        stockAmountList: [],
        stockAmount: 0,
        productStockMovementList: [],
        filteredStockMovementList: [],

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

        /// Cart
        itemQuantity: 0,
        itemQuantityList: [],
        itemNote: '',
        customPrice: 0,
        cartItem: TransactionDetail(),
        itemDiscountInCash: 0,
        itemDiscountInPercent: 0,

        /// Firebase
        isLoadingBusinessMessages: false,
        isSendingBusinessMessage: false,
        businessChatMessage: '',
        businessMessageList: [],
      );
}
