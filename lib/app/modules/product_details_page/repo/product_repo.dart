import '../../../data/home_page_data_model.dart';
import '../../home/controllers/home_controller.dart';
import 'package:get/get.dart';

class ProductRepo {
  Future<Product?> getProductDetails(int productId) {
    return Future.delayed(const Duration(seconds: 2), () {
      final HomeController homeController = Get.find<HomeController>();
      // Combine all products into a single list for easier searching
      final List<Product> allProducts = <Product>[
        ...homeController.homePageDataModel.value.recentOrder!,
        ...homeController.homePageDataModel.value.seasonalProducts!,
      ];

      // Find the product by id
      final Product? product = allProducts.firstWhereOrNull(
        (Product product) => product.id == productId,
      );

      return product;
    });
  }
}
