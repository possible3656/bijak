import '../../../../res/strings.dart';
import '../../../../theme/text_styles.dart';
import '../../../../utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  const HomeSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
      child: TextField(
        decoration: InputDecoration(
          hintText: Strings.searchHere,
          hintStyle: TextStyles.grey14Regular,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: theme.blackColor),
          ),
          suffixIcon: const Icon(Icons.search),
          filled: true,
          fillColor: theme.whiteColor,
        ),
      ),
    );
  }
}
