import 'package:bijak/app/modules/home/controllers/home_controller.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeImageBanner extends GetView<HomeController> {
  const HomeImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 2 / 3,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1),
        items: (controller.homePageDataModel.sliderImages ?? []).map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.greyColor,
                  image: DecorationImage(
                    image: NetworkImage(i, scale: .1),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }
}
