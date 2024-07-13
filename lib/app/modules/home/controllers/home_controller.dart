import 'dart:async';
import 'dart:developer';

import 'package:bijak/app/data/home_page_data_model.dart';
import 'package:bijak/app/modules/home/repo/home_repo.dart';
import 'package:get/get.dart';

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
    loading.value = false;
  }

  /// Handles the button press event for recently ordered products.
  ///
  /// The [index] parameter specifies the index of the product in the list.
  /// The [isAdded] parameter indicates whether the product is being added or removed.
  void onRecentlyOrderedPressed({required int index, required bool isAdded}) {
    final product = homePageDataModel.value.recentOrder?[index];
    removeExistingProduct(product);
    if (product != null) {
      if (isAdded) {
        ++homePageDataModel.value.recentOrder?[index].quantity;
      } else {
        --homePageDataModel.value.recentOrder?[index].quantity;
      }
    }
    updateCartItems(product!);
    homePageDataModel.refresh();
  }

  /// Handles the button press event for seasonal products.
  ///
  /// The [index] parameter specifies the index of the product in the list.
  /// The [isAdded] parameter indicates whether the product is being added or removed.
  void onSeasonalProductPressed({required int index, required bool isAdded}) {
    final product = homePageDataModel.value.seasonalProducts?[index];
    removeExistingProduct(product);
    if (product != null) {
      if (isAdded) {
        ++homePageDataModel.value.seasonalProducts?[index].quantity;
      } else {
        --homePageDataModel.value.seasonalProducts?[index].quantity;
      }
    }
    updateCartItems(product!);
    homePageDataModel.refresh();
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
    cartItems.add(product);
    cartItems.removeWhere((element) => element.quantity == 0);
    for (var element in cartItems) {
      log('Cart Items: ${element.toJson()}');
    }
  }

  /// Returns the total number of items in the cart.
  int getItemCount() {
    int itemCount = 0;
    for (var element in cartItems) {
      itemCount += element.quantity;
    }
    return itemCount;
  }

  /// Returns the total price of all items in the cart.
  int getTotalPrice() {
    int totalPrice = 0;
    for (var element in cartItems) {
      totalPrice += element.quantity * int.parse(element.price ?? '0');
    }
    return totalPrice;
  }
}
