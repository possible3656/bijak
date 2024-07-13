import 'package:flutter/material.dart';

import '../../data/home_page_data_model.dart';
import '../../res/strings.dart';
import '../../theme/text_styles.dart';
import '../extensions/theme_extensions.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.item,
    required this.quantity,
    required this.onAddToCartPressed,
  });
  final Product item;
  final int quantity;
  final Function({required Product item, required bool isAdded})
      onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return quantity == 0
        ? InkWell(
            onTap: () => onAddToCartPressed(item: item, isAdded: true),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(Strings.addToCart, style: TextStyles.white12Bold),
              ],
            ),
          )
        : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () => onAddToCartPressed(item: item, isAdded: false),
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.remove,
                      size: 16,
                      color: themeData.whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  height: double.maxFinite,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      quantity.toString(),
                      textAlign: TextAlign.center,
                      style: themeData.textTheme.titleSmall?.copyWith(
                        color: themeData.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () => onAddToCartPressed(item: item, isAdded: true),
                  child: Container(
                    height: double.maxFinite,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 16,
                      color: themeData.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
