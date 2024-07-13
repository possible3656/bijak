import 'dart:async';
import 'dart:developer';

import 'package:get/get.dart';

import '../../../data/home_page_data_model.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/global_methods.dart';
import '../repo/home_repo.dart';

/// Controller class for the home page.
class HomeController extends GetxController {
  RxBool loading = true.obs;
  HomeRepo homeRepo = HomeRepo();
  Rx<HomePageDataModel> homePageDataModel = HomePageDataModel().obs;
  RxList<Product> cartItems = <Product>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchHomePageData();
  }

  /// Fetches the home page data from the repository.
  Future<void> fetchHomePageData() async {
    homePageDataModel.value = await homeRepo.getHomePageData();
    GlobalMethods.hapticFeedback();
    loading.value = false;
  }

  /// Handles the button press event for any product.
  ///
  /// The [item] parameter specifies the product in the list.
  /// The [isAdded] parameter indicates whether the product is being added or removed.
  void onProductPressed({required Product item, required bool isAdded}) {
    final Product product = homePageDataModel.value.recentOrder!.firstWhere(
      (Product element) => element.id == item.id,
      orElse: () => homePageDataModel.value.seasonalProducts!
          .firstWhere((Product element) => element.id == item.id),
    );

    removeExistingProduct(product);
    if (isAdded) {
      ++product.quantity;
    } else {
      --product.quantity;
    }
    updateCartItems(product);
    homePageDataModel.refresh();
    GlobalMethods.hapticFeedback();
  }

  /// Removes an existing product from the cart items list.
  ///
  /// The [product] parameter specifies the product to be removed.
  void removeExistingProduct(Product? product) {
    if (cartItems.contains(product)) {
      cartItems.remove(product);
    }
  }

  /// Updates the cart items list with a new product.
  ///
  /// The [product] parameter specifies the product to be added.
  void updateCartItems(Product product) {
    if (product.quantity > 0) {
      cartItems.add(product);
    } else {
      cartItems.remove(product);
    }
    for (Product element in cartItems) {
      log('Cart Items: ${element.toJson()}');
    }
  }

  /// Returns the total number of items in the cart.
  int getItemCount() {
    int itemCount = 0;
    for (Product element in cartItems) {
      itemCount += element.quantity;
    }
    return itemCount;
  }

  /// Returns the total price of all items in the cart.
  int getTotalPrice() {
    int totalPrice = 0;
    for (Product element in cartItems) {
      totalPrice += element.quantity * int.parse(element.price ?? '0');
    }
    return totalPrice;
  }

  void goToProductDetails(Product product) {
    GlobalMethods.hapticFeedback();
    Get.toNamed(Routes.PRODUCT_DETAILS_PAGE, arguments: product.id)
        ?.then((value) {
      refresh();
    });
  }
}
