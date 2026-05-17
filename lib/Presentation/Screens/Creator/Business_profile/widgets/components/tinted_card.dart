import 'package:flutter/material.dart';

class BusinessProfileTintedCard extends StatelessWidget {
  const BusinessProfileTintedCard({
    super.key,
    required this.title,
    this.body,
    this.subtitle,
    this.leading,
    this.trailing,
    this.showDivider = false,
    this.minHeight,
  });

  final String title;
  final String? body;
  final String? subtitle;
  final Widget? leading;
  final Widget? trailing;
  final bool showDivider;
  final double? minHeight;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final fill = colorScheme.surfaceContainerHighest;

    return Material(
      elevation: 0.5,
      shadowColor: colorScheme.shadow.withValues(alpha: 0.08),
      color: fill,
      borderRadius: BorderRadius.circular(12),
      clipBehavior: Clip.antiAlias,
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: minHeight ?? 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (leading != null) ...[
                    SizedBox(width: 22, height: 22, child: leading),
                    const SizedBox(width: 10),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.45,
                            color: colorScheme.onSurface,
                          ),
                        ),
                        if (subtitle != null && subtitle!.isNotEmpty) ...[
                          const SizedBox(height: 4),
                          Text(
                            subtitle!,
                            style: textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurface.withValues(alpha: 0.5),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  if (trailing != null) trailing!,
                ],
              ),
              if (showDivider) ...[
                const SizedBox(height: 12),
                Divider(
                  height: 1,
                  thickness: 1,
                  color: colorScheme.primary.withValues(alpha: 0.28),
                ),
              ],
              if (body != null && body!.isNotEmpty) ...[
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
      ),
    );
  }
}
