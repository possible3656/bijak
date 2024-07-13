import 'package:flutter/material.dart';

import '../../../../res/strings.dart';
import '../../../../utils/extensions/theme_extensions.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.account_circle,
          size: 28,
          color: theme.whiteColor,
        ),
        onPressed: () {},
      ),
      title: const Text(
        Strings.appName,
      ),
      centerTitle: true,
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.logout,
            size: 28,
            color: theme.whiteColor,
          ),
          onPressed: () {},
          padding: const EdgeInsets.only(right: 16),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
