import 'package:bijak/app/res/strings.dart';
import 'package:bijak/app/theme/text_styles.dart';
import 'package:bijak/app/utils/extensions/theme_extensions.dart';
import 'package:flutter/material.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.index,
    required this.quantity,
    required this.onAddToCartPressed,
  });
  final int index;
  final int quantity;
  final Function({required int index, required bool isAdded})
      onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return quantity == 0
        ? InkWell(
            onTap: () => onAddToCartPressed(index: index, isAdded: true),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                  onTap: () => onAddToCartPressed(index: index, isAdded: false),
                  child: Container(
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    quantity.toString(),
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.titleSmall?.copyWith(
                      color: themeData.whiteColor,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: InkWell(
                  onTap: () => onAddToCartPressed(index: index, isAdded: true),
                  child: Container(
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
