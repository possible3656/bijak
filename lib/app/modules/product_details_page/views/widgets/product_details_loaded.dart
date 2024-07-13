import 'package:bijak/app/modules/product_details_page/controllers/product_details_page_controller.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:bijak/app/utils/widgets/add_to_cart_button.dart';
import 'package:bijak/app/utils/widgets/magic_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsLoaded extends GetView<ProductDetailsPageController> {
  const ProductDetailsLoaded({super.key});

  @override
  Widget build(BuildContext context) {
    final product = controller.product;
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            AspectRatio(
              aspectRatio: 2 / 3,
              child: MagicImage(
                imageUrl: product.value?.image,
                errorIcon: const Icon(Icons.image),
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
                        Colors.white.withOpacity(.4)),
                    shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                    padding: WidgetStateProperty.all<EdgeInsets>(
                        const EdgeInsets.all(8.0)), // Adjust padding as needed
                  ),
                ),
              ),
            )
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
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
              child: Obx(() => AddToCartButton(
                  item: product.value!,
                  quantity: product.value?.quantity ?? 0,
                  onAddToCartPressed: controller.onAddToCartPressed)),
            )
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
        const Spacer(),
      ],
    );
  }
}
