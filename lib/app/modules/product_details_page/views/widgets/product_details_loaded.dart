import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../data/home_page_data_model.dart';
import '../../../../theme/text_styles.dart';
import '../../../../utils/extensions/theme_extensions.dart';
import '../../../../utils/widgets/add_to_cart_button.dart';
import '../../../../utils/widgets/magic_image.dart';
import '../../controllers/product_details_page_controller.dart';

class ProductDetailsLoaded extends GetView<ProductDetailsPageController> {
  const ProductDetailsLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final Rx<Product?> product = controller.product;
    final ThemeData theme = Theme.of(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Stack(
            children: <Widget>[
              AspectRatio(
                aspectRatio: 2 / 3,
                child: MagicImage(
                  imageUrl: product.value?.image,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                  ),
                  child: BackButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all<Color>(
                        Colors.white.withOpacity(.4),
                      ),
                      shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                      padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(
                          8.0,
                        ),
                      ), // Adjust padding as needed
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            child: Text(
              product.value?.name ?? 'Product Name',
              style: TextStyles.black12Regular,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Text(
                      product.value?.weight ?? '1 kg',
                      style: TextStyles.grey10Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
                    child: Text(
                      '₹ ${product.value?.price ?? '-'}',
                      style: TextStyles.grey10Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.blackColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                margin: const EdgeInsets.only(right: 8),
                height: 35,
                width: Get.width * .25,
                child: Obx(
                  () => AddToCartButton(
                    item: product.value!,
                    quantity: product.value?.quantity ?? 0,
                    onAddToCartPressed: controller.onAddToCartPressed,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            child: Text(
              product.value?.description ?? 'No description available',
              style: TextStyles.grey10Regular,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
