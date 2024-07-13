import 'home_category_list.dart';
import 'home_horizontal_product_list.dart';
import 'home_image_banner.dart';
import 'home_search_bar.dart';
import 'home_vertical_product_list.dart';
import 'package:flutter/material.dart';

class HomeLoadedView extends StatelessWidget {
  const HomeLoadedView({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
