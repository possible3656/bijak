import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeImageBanner extends StatelessWidget {
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
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                decoration: BoxDecoration(
                  color: theme.greyColor,
                  image: const DecorationImage(
                    image: NetworkImage('https://via.placeholder.com/150'),
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
