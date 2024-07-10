import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class HomeCategoryList extends StatelessWidget {
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
            height: 72,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                HomeCategoryItem(title: 'Vegetables'),
                HomeCategoryItem(title: 'Fruits'),
                HomeCategoryItem(title: 'Fresh Juice Items'),
                HomeCategoryItem(title: 'Combos'),
                HomeCategoryItem(title: 'Pure Produced Items'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HomeCategoryItem extends StatelessWidget {
  final String title;

  const HomeCategoryItem({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16),
      child: Column(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.grey[300],
            backgroundImage:
                const NetworkImage('https://via.placeholder.com/48'),
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
    );
  }
}
