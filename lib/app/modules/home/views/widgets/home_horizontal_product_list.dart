import 'package:bijak/app/data/home_page_data_model.dart';
import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:bijak/app/utils/widgets/add_to_cart_button.dart';
import 'package:bijak/app/utils/widgets/magic_image.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

import '../../../../res/strings.dart';

class HomeHorizontalProductList extends GetView<HomeController> {
  const HomeHorizontalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            Strings.recentlyOrdered,
            style: TextStyles.black14Bold,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount:
                  controller.homePageDataModel.value.recentOrder?.length ?? 0,
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) {
                return Obx(() => ProductItem(
                    item:
                        controller.homePageDataModel.value.recentOrder![index],
                    index: index,
                    onAddToCartPressed: controller.onProductPressed,
                    onProductPressed: () => controller.goToProductDetails(
                        controller
                            .homePageDataModel.value.recentOrder![index])));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem(
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
    return GestureDetector(
      onTap: onProductPressed,
      child: Container(
        width: 96,
        margin: const EdgeInsets.only(right: 16),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
                child: SizedBox(
                  height: 96,
                  width: 96,
                  child: MagicImage(
                    imageUrl: item.image,
                    size: const Size(96, 96),
                  ),
                )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(
                          item.name ?? 'Product $index',
                          style: TextStyles.black12Regular,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.weight,
                          style: TextStyles.grey10Regular,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '₹ ${item.price ?? '-'}',
                          style: TextStyles.grey10Regular,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    child: Container(
                      decoration: BoxDecoration(
                          color: theme.blackColor,
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(8),
                              bottomRight: Radius.circular(8))),
                      child: AddToCartButton(
                          item: item,
                          quantity: item.quantity,
                          onAddToCartPressed: onAddToCartPressed),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
