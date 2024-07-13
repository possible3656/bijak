import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeCategoryList extends GetView<HomeController> {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Strings.categories,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: theme.blackColor),
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 86,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  controller.homePageDataModel.value.categories?.length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final element =
                    controller.homePageDataModel.value.categories?[index];
                return HomeCategoryItem(
                  title: element?.title ?? '',
                  imageUrl: element?.image ?? '',
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCategoryItem extends StatelessWidget {
  final String title;
  final String imageUrl;

  const HomeCategoryItem(
      {super.key, required this.title, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 64,
        child: Column(
          children: [
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey[300],
              backgroundImage: NetworkImage(imageUrl, scale: .1),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: TextStyles.black12Bold,
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
