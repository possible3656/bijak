import 'package:bijak/app/data/home_page_data_model.dart';
import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:bijak/app/utils/widgets/add_to_cart_button.dart';
import 'package:bijak/app/utils/widgets/magic_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVerticalProductList extends GetView<HomeController> {
  const HomeVerticalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Text(
            Strings.seasonProducts,
            style: TextStyles.black14Bold,
          ),
        ),
        const SizedBox(height: 8),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount:
              controller.homePageDataModel.value.seasonalProducts?.length ?? 0,
          itemBuilder: (context, index) {
            return Obx(() => VerticalProductItem(
                item:
                    controller.homePageDataModel.value.seasonalProducts![index],
                index: index,
                onAddToCartPressed: controller.onProductPressed,
                onProductPressed: () => controller.goToProductDetails(
                      controller
                          .homePageDataModel.value.seasonalProducts![index],
                    )));
          },
        ),
      ],
    );
  }
}

class VerticalProductItem extends StatelessWidget {
  const VerticalProductItem(
      {super.key,
      required this.item,
      required this.index,
      required this.onAddToCartPressed,
      required this.onProductPressed});
  final Product item;
  final int index;
  final Function({required Product item, required bool isAdded})
      onAddToCartPressed;
  final Function() onProductPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final image = item.image ?? '';
    final name = item.name ?? 'Product $index';
    final weight = item.weight;
    final price = item.price ?? '-';
    return GestureDetector(
      onTap: onProductPressed,
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: [
              MagicImage(imageUrl: image, size: const Size(96, 96)),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: TextStyles.black12Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      weight,
                      style: TextStyles.grey10Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '₹ $price',
                      style: TextStyles.grey10Regular,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: BoxDecoration(
                      color: theme.blackColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 35,
                    width: Get.width * .25,
                    child: AddToCartButton(
                        item: item,
                        quantity: item.quantity,
                        onAddToCartPressed: onAddToCartPressed),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
