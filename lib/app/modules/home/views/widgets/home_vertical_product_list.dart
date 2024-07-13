import '../../../../data/home_page_data_model.dart';
import '../../controllers/home_controller.dart';
import '../../../../res/strings.dart';
import '../../../../theme/text_styles.dart';
import '../../../../utils/extensions/theme_extensions.dart';
import '../../../../utils/widgets/add_to_cart_button.dart';
import '../../../../utils/widgets/magic_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVerticalProductList extends GetView<HomeController> {
  const HomeVerticalProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
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
          padding: EdgeInsets.zero,
          itemCount:
              controller.homePageDataModel.value.seasonalProducts?.length ?? 0,
          itemBuilder: (BuildContext context, int index) {
            return Obx(() => VerticalProductItem(
                item:
                    controller.homePageDataModel.value.seasonalProducts![index],
                index: index,
                onAddToCartPressed: controller.onProductPressed,
                onProductPressed: () => controller.goToProductDetails(
                      controller
                          .homePageDataModel.value.seasonalProducts![index],
                    ),),);
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
      required this.onProductPressed,});
  final Product item;
  final int index;
  final Function({required Product item, required bool isAdded})
      onAddToCartPressed;
  final Function() onProductPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final String image = item.image ?? '';
    final String name = item.name ?? 'Product $index';
    final String weight = item.weight;
    final String price = item.price ?? '-';
    return GestureDetector(
      onTap: onProductPressed,
      child: IntrinsicHeight(
        child: Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: <BoxShadow>[
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 3,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Row(
            children: <Widget>[
              SizedBox(
                  height: 96,
                  width: 96,
                  child: MagicImage(imageUrl: image, size: const Size(96, 96)),),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
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
                    height: 45,
                    width: Get.width * .25,
                    child: IntrinsicHeight(
                      child: AddToCartButton(
                          item: item,
                          quantity: item.quantity,
                          onAddToCartPressed: onAddToCartPressed,),
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}
