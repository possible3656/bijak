import 'package:flutter/material.dart';

class MagicImage extends StatelessWidget {
  final String? imageUrl;
  final Icon? errorIcon;
  final Color errorBackgroundColor;
  final Size? size;

  const MagicImage({
    super.key,
    required this.imageUrl,
    this.errorIcon = const Icon(Icons.image),
    this.errorBackgroundColor = const Color.fromRGBO(238, 238, 238, 1),
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent, // Default background color
      ),
      child: Image.network(
        imageUrl ?? "",
        width: size?.width,
        height: size?.height,
        scale: .1,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: SizedBox(
              width: 30,
              height: 30,
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: errorBackgroundColor,
            child: Center(
              child: errorIcon,
            ),
          );
        },
      ),
    );
  }
}
