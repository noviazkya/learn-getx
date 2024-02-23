import 'package:get/get.dart';

import '../middlewares/auth_middleware.dart';
import '../modules/button_navigation/bindings/button_navigation_binding.dart';
import '../modules/button_navigation/views/button_navigation_view.dart';
import '../modules/collection/bindings/collection_binding.dart';
import '../modules/collection/views/collection_create.dart';
import '../modules/collection/views/collection_view.dart';
import '../modules/counter/bindings/counter_binding.dart';
import '../modules/counter/views/counter_view.dart';
import '../modules/formulir/bindings/formulir_binding.dart';
import '../modules/formulir/views/formulir_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/payment/bindings/payment_binding.dart';
import '../modules/payment/views/payment_output.dart';
import '../modules/payment/views/payment_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';

import 'package:belajar_getx/app/modules/collection/views/collection_show.dart'; // Import CollectionShowView

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.BUTTON_NAVIGATION;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.COUNTER,
      page: () => CounterView(),
      binding: CounterBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.FORMULIR,
      page: () => FormulirView(),
      binding: FormulirBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.PAYMENT,
      page: () => PaymentView(),
      binding: PaymentBinding(),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.PAYMENT_OUTPUT,
      page: () => PaymentOutput(dataFormulir: Get.arguments),
      middlewares: [AuthMiddleware()],
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
      middlewares: [
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
      middlewares: [
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.COLLECTION,
      page: () => CollectionView(),
      binding: CollectionBinding(),
           middlewares: [
        AuthCheckMiddleware(),
      ],
    ),
    GetPage(
      name: _Paths.COLLECTION_ADD,
      page: () => CollectionCreateView(),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: _Paths.COLLECTION_SHOW,
      page: () => CollectionShowView(collection: Get.arguments),
      binding: CollectionBinding(),
    ),
    GetPage(
      name: _Paths.BUTTON_NAVIGATION,
      page: () => ButtonNavigationView(),
      binding: ButtonNavigationBinding(),
      middlewares: [
        AuthCheckMiddleware(),
      ],
    ),
  ];
}
