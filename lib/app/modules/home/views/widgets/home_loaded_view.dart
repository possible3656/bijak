import 'package:bijak/app/modules/home/views/widgets/home_category_list.dart';
import 'package:bijak/app/modules/home/views/widgets/home_horizontal_product_list.dart';
import 'package:bijak/app/modules/home/views/widgets/home_image_banner.dart';
import 'package:bijak/app/modules/home/views/widgets/home_search_bar.dart';
import 'package:bijak/app/modules/home/views/widgets/home_vertical_product_list.dart';
import 'package:flutter/material.dart';

class HomeLoadedView extends StatelessWidget {
  const HomeLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeSearchBar(),
          HomeImageBanner(),
          HomeCategoryList(),
          HomeHorizontalProductList(),
          HomeVerticalProductList(),
        ],
      ),
    );
  }
}
