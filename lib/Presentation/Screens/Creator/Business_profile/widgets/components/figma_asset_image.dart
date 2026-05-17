import 'package:flutter/material.dart';

/// Figma export asset — short-lived URL; swap for `AssetImage` / cached network in production.
class FigmaAssetImage extends StatelessWidget {
  const FigmaAssetImage({
    super.key,
    required this.url,
    this.size,
    this.fit = BoxFit.cover,
  });

  final String url;
  final double? size;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    final s = size;
    Widget child = Image.network(
      url,
      fit: fit,
      errorBuilder: (_, _, _) => Icon(
        Icons.broken_image_outlined,
        size: s != null ? s * 0.4 : 24,
        color: Theme.of(context).colorScheme.outline,
      ),
    );
    if (s != null) {
      child = SizedBox(width: s, height: s, child: child);
    }
    return child;
  }
}
