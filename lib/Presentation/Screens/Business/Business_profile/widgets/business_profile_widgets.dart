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

class BusinessProfileIdentityRow extends StatelessWidget {
  const BusinessProfileIdentityRow({
    super.key,
    required this.avatarUrl,
    required this.brandName,
    required this.categoryLabel,
    required this.avatarDiameter,
  });

  final String avatarUrl;
  final String brandName;
  final String categoryLabel;
  final double avatarDiameter;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: FigmaAssetImage(
            url: avatarUrl,
            size: avatarDiameter,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(width: avatarDiameter * 0.12),
        Expanded(
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 4,
            children: [
              Text(
                brandName,
                style: textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.6,
                  color: colorScheme.onSurface,
                ),
              ),
              Text(
                categoryLabel,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.42,
                  color: colorScheme.onSurface.withValues(alpha: 0.7),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BusinessProfileTintedCard extends StatelessWidget {
  const BusinessProfileTintedCard({
    super.key,
    required this.title,
    this.body,
    this.leading,
    this.showDivider = false,
  });

  final String title;
  final String? body;
  final Widget? leading;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final fill = colorScheme.surfaceContainerHighest;

    return Material(
      color: fill,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (leading != null) ...[
                  SizedBox(width: 20, height: 20, child: leading),
                  const SizedBox(width: 10),
                ],
                Expanded(
                  child: Text(
                    title,
                    style: textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.45,
                      color: colorScheme.onSurface,
                    ),
                  ),
                ),
              ],
            ),
            if (showDivider) ...[
              const SizedBox(height: 10),
              Divider(
                height: 1,
                thickness: 1,
                color: colorScheme.primary.withValues(alpha: 0.3),
              ),
            ],
            if (body != null) ...[
              const SizedBox(height: 10),
              Text(
                body!,
                style: textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.42,
                  height: 1.35,
                  color: colorScheme.onSurface.withValues(alpha: 0.47),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class BusinessProfileReviewsInstagramRow extends StatelessWidget {
  const BusinessProfileReviewsInstagramRow({
    super.key,
    required this.reviewsIconUrl,
    required this.instagramIconUrl,
    this.onReviewsTap,
    this.onInstagramTap,
  });

  final String reviewsIconUrl;
  final String instagramIconUrl;
  final VoidCallback? onReviewsTap;
  final VoidCallback? onInstagramTap;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;

    return LayoutBuilder(
      builder: (context, c) {
        final maxW = c.maxWidth;
        final gap = maxW * 0.02;
        final reviewsWidth = (maxW - gap) * 0.46;

        return Row(
          children: [
            SizedBox(
              width: reviewsWidth,
              height: 45,
              child: FilledButton(
                style: FilledButton.styleFrom(
                  backgroundColor: colorScheme.primary,
                  foregroundColor: colorScheme.onPrimary,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: onReviewsTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 20,
                      height: 20,
                      child: FigmaAssetImage(
                        url: reviewsIconUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Reviews',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.45,
                        color: colorScheme.onPrimary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(width: gap.clamp(8, 20)),
            Expanded(
              child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: colorScheme.onSurface,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                ),
                onPressed: onInstagramTap,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 22,
                      height: 22,
                      child: FigmaAssetImage(
                        url: instagramIconUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Instagram',
                      style: textTheme.titleSmall?.copyWith(
                        fontWeight: FontWeight.w600,
                        letterSpacing: 0.45,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
