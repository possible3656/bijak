import 'dart:async';

import 'package:bijak/app/data/home_page_data_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool loading = true.obs;
  HomePageDataModel homePageDataModel = HomePageDataModel();

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  void fetchHomePageData() {
    Future.delayed(const Duration(seconds: 5), alignData);
  }

  void alignData() {
    homePageDataModel = HomePageDataModel(sliderImages: [
      'https://img.freepik.com/premium-vector/grocery-store-promotion-catalog-cheap-price-flyer-template_606364-656.jpg?w=740',
      'https://img.freepik.com/premium-vector/supermarket-online-shop-promotion-flyer-catalog-template_606364-664.jpg?w=740',
      'https://img.freepik.com/premium-vector/promotion-flyer-template-design-grocery-store_606364-761.jpg?w=740',
    ], categories: [
      Category(
          title: 'Fruits',
          image:
              'https://www.fruitsmith.com/pub/media/mageplaza/blog/post/s/e/seedless_fruits.jpg'),
      Category(
          title: 'Vegetables',
          image:
              'https://t4.ftcdn.net/jpg/03/20/39/89/360_F_320398931_CO8r6ymeSFqeoY1cE6P8dbSGRYiAYj4a.jpg'),
      Category(
          title: 'Juices',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcShxK2QV1fG8KWdfgjOJ71_neEbObsvB6lFPQ&s'),
      Category(
          title: 'Combos',
          image:
              'https://www.spoton.com/blog/content/images/size/w1200/2023/08/Mocktail--zero-proof-cocktails--and-different-non-alcoholic-drinks-1.jpeg'),
      Category(
          title: 'Pure Produced Items',
          image:
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRnFdTreGIiC27qhxWk6fxVVGnvRb2_4zC9sA&s'),
    ], recentOrder: [], seasonalProducts: []);
    loading.value = false;
  }
}
