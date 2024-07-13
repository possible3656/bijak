import '../../../data/home_page_data_model.dart';
import '../../home/controllers/home_controller.dart';
import '../repo/product_repo.dart';
import '../../../utils/global_methods.dart';
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
