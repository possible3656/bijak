import 'package:bijak/app/data/home_page_data_model.dart';
import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/modules/product_details_page/repo/product_repo.dart';
import 'package:bijak/app/utils/global_methods.dart';
import 'package:get/get.dart';

class ProductDetailsPageController extends GetxController {
  int productId = Get.arguments;
  ProductRepo productRepo = ProductRepo();
  RxBool loading = true.obs;
  late Rx<Product?> product = Product().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProductDetails();
  }

  Future<void> fetchProductDetails() async {
    loading.value = true;
    product.value = (await productRepo.getProductDetails(productId));
    loading.value = false;
    GlobalMethods.hapticFeedback();
  }

  onAddToCartPressed({required bool isAdded, required Product item}) {
    GlobalMethods.hapticFeedback();

    Get.find<HomeController>().onProductPressed(item: item, isAdded: isAdded);
    product.refresh();
  }
}
