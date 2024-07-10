import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../extensions/theme_extensions.dart';

class MagicLoader extends StatelessWidget {
  const MagicLoader({super.key, this.size = 20, this.color});
  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Platform.isIOS
        ? CupertinoActivityIndicator(
            color: color ?? theme.blackColor,
          )
        : CircularProgressIndicator(
            strokeWidth: 2,
            valueColor:
                AlwaysStoppedAnimation<Color>(color ?? theme.blackColor),
          );
  }
}
