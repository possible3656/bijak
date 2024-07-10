import 'package:bijak/app/modules/home/views/widgets/home_category_list.dart';
import 'package:bijak/app/modules/home/views/widgets/home_horizontal_product_list.dart';
import 'package:bijak/app/modules/home/views/widgets/home_image_banner.dart';
import 'package:bijak/app/modules/home/views/widgets/home_search_bar.dart';
import 'package:bijak/app/modules/home/views/widgets/home_vertical_product_list.dart';
import 'package:bijak/app/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.person),
          onPressed: () {},
        ),
        title: const Text(
          Strings.appName,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {},
            padding: const EdgeInsets.only(right: 16),
          ),
        ],
      ),
      body: const SingleChildScrollView(
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
      ),
    );
  }
}
