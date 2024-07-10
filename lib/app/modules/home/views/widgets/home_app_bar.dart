import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      title: Text(
        Strings.appName,
        style: TextStyle(
            fontSize: 16, fontWeight: FontWeight.bold, color: theme.whiteColor),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () {},
          padding: const EdgeInsets.only(right: 16),
        ),
      ],
    );
  }
}
