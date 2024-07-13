import '../../controllers/home_controller.dart';
import '../../../../utils/widgets/magic_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class HomeImageBanner extends GetView<HomeController> {
  const HomeImageBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
      child: CarouselSlider(
        options: CarouselOptions(
            aspectRatio: 2 / 3,
            autoPlay: true,
            enlargeCenterPage: true,
            viewportFraction: 1,),
        items: (controller.homePageDataModel.value.sliderImages ?? <String>[]).map((String i) {
          return Builder(
            builder: (BuildContext context) {
              return MagicImage(
                  imageUrl: i,
                  errorIcon: const Icon(
                    Icons.image,
                    size: 48,
                  ),);
            },
          );
        }).toList(),
      ),
    );
  }
}
