import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/product_details_page/bindings/product_details_page_binding.dart';
import '../modules/product_details_page/views/product_details_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCT_DETAILS_PAGE,
      page: () => const ProductDetailsPageView(),
      binding: ProductDetailsPageBinding(),
    ),
  ];
}
