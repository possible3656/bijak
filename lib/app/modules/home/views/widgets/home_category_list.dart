import '../../controllers/home_controller.dart';
import '../../../../res/strings.dart';
import '../../../../theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import '../../../../data/home_page_data_model.dart';

class HomeCategoryList extends GetView<HomeController> {
  const HomeCategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            Strings.categories,
            style: TextStyles.black14Bold,
          ),
          const SizedBox(height: 8),
          SizedBox(
            height: 90,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount:
                  controller.homePageDataModel.value.categories?.length ?? 0,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.zero,
              itemBuilder: (BuildContext context, int index) {
                final Category? element =
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

  const HomeCategoryItem(
      {super.key, required this.title, required this.imageUrl,});
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: SizedBox(
        width: 64,
        child: Column(
          children: <Widget>[
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
              overflow: TextOverflow.visible,
            ),
          ],
        ),
      ),
    );
  }
}
