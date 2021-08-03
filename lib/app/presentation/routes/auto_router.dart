import 'package:auto_route/auto_route.dart';
import 'package:auto_route/auto_route_annotations.dart';

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

@MaterialAutoRouter(
  routes: <AutoRoute>[
    CustomRoute(
      page: SplashView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      initial: true,
    ),
    CustomRoute(
      page: LoginView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: RegistrationView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: CartView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddNotesView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddDiscountView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: CheckoutView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: ProductsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddProductView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: EditProductView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: CategoryView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddCategoryView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: CustomerView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddCustomerView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddCustomerCartView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: TakePictureView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: PayView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: TransactionsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: TransactionCompleteView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: UsersView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddUserView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: SettingsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: HelpView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: CalendarView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: BusinessView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddBusinessView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AnalyticsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AmountInputView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: EditBusinessView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddPartnerView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: BusinessPartnerView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: QrGenerateView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: BusinessCodeScannerView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: EditCartQuantityView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: GroupBusinessChatView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: InputBusinenssQRView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: ProfileSettingsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: EditCartDiscountView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: AddStocksView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: InputStockAmountView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
    CustomRoute(
      page: StockMovementsView,
      transitionsBuilder: TransitionsBuilders.fadeIn,
      durationInMilliseconds: 100,
    ),
  ],
)
class $AutoRouter {}
