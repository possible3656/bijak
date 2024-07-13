import 'widgets/product_details_loaded.dart';
import '../../../utils/widgets/magic_loader.dart';
import '../../../utils/widgets/nudge_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/product_details_page_controller.dart';

class ProductDetailsPageView extends GetView<ProductDetailsPageController> {
  const ProductDetailsPageView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NudgeBar(),
      body: Obx(() => controller.loading.value
          ? const Center(child: MagicLoader())
          : const ProductDetailsLoaded(),),
    );
  }
}
