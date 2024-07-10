import 'package:bijak/app/modules/home/views/widgets/home_horizontal_product_list.dart';
import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeVerticalProductList extends StatelessWidget {
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
          itemCount: 5,
          itemBuilder: (context, index) {
            return const VerticalProductItem();
          },
        ),
      ],
    );
  }
}

class VerticalProductItem extends StatelessWidget {
  const VerticalProductItem({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return IntrinsicHeight(
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        // height: 96,
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
            Image.network(
              'https://via.placeholder.com/96',
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 8),
            const Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: TextStyles.black12Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Product Weight',
                    style: TextStyles.grey10Regular,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '\$Price',
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
                  child: const AddRemoveItemWidget(
                    index: 0,
                    quantity: 0,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
