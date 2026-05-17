import 'package:flutter/material.dart';

class BusinessProfileReviewsInstagramRow extends StatelessWidget {
  const BusinessProfileReviewsInstagramRow({
    super.key,
    required this.reviewsIconUrl,
    required this.instagramIconUrl,
    this.instagramHandle,
    this.onReviewsTap,
    this.onInstagramTap,
    this.isInstagramSelected = false,
  });

  final String reviewsIconUrl;
  final String instagramIconUrl;
  final String? instagramHandle;
  final VoidCallback? onReviewsTap;
  final VoidCallback? onInstagramTap;
  final bool isInstagramSelected;

  @override
  Widget build(BuildContext context) {
   

    return LayoutBuilder(
      builder: (context, c) {
        final maxW = c.maxWidth;
        final gap = 12.0;
        final itemWidth = (maxW - gap) / 2;

        return Row(
          children: [
            _buildButton(
              context,
              'Reviews',
              Icons.star_rounded,
              !isInstagramSelected,
              onReviewsTap,
              itemWidth,
            ),
            SizedBox(width: gap),
            _buildButton(
              context,
              'Instagram',
              null, // No icon data needed when using imagePath
              isInstagramSelected,
              onInstagramTap,
              itemWidth,
              imagePath: 'assets/icons/Vector.png',
            ),
          ],
        );
      },
    );
  }

  Widget _buildButton(
    BuildContext context,
    String label,
    IconData? icon,
    bool isActive,
    VoidCallback? onTap,
    double width, {
    String? imagePath,
  }) {
    final colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width,
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? colorScheme.primary : Colors.white,
          foregroundColor: isActive ? Colors.white : colorScheme.primary,
          elevation: isActive ? 2 : 0,
          shadowColor: colorScheme.primary.withOpacity(0.2),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: isActive
                ? BorderSide.none
                : BorderSide(color: colorScheme.primary.withOpacity(0.15)),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12),
        ),
        onPressed: onTap,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (imagePath != null)
              Image.asset(
                imagePath,
                width: 20,
                height: 20,
                color: isActive ? Colors.white : Colors.black,
              )
            else if (icon != null)
              Icon(
                icon,
                size: 20,
                color: isActive ? Colors.white : Colors.black,
              ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 14,
                color: isActive ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
