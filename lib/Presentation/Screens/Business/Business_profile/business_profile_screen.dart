import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Business/Business_profile/business_profile_view_data.dart';
import 'package:snappis/Presentation/Screens/Business/Business_profile/widgets/business_profile_widgets.dart';

/// Business / brand profile sheet from Figma `514:918`.
///
/// Uses a **local** Material 3 [Theme] so colors stay faithful to the frame
/// without changing app-wide [ThemeData].
class BusinessProfileScreen extends StatelessWidget {
  const BusinessProfileScreen({
    super.key,
    required this.data,
    this.onWebsiteTap,
    this.onReviewsTap,
    this.onInstagramTap,
  });

  final BusinessProfileViewData data;
  final VoidCallback? onWebsiteTap;
  final VoidCallback? onReviewsTap;
  final VoidCallback? onInstagramTap;

  static const double _designWidth = 390;

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context);
    const headerPurple = Color(0xFFA470FF);
    const onSurfaceDeep = Color(0xFF04000A);
    const cardLavender = Color(0xFFE8DFF9);

    final localTheme = base.copyWith(
      colorScheme: base.colorScheme.copyWith(
        primary: headerPurple,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: onSurfaceDeep,
        surfaceContainerHighest: cardLavender,
      ),
    );

    return Theme(
      data: localTheme,
      child: Scaffold(
        backgroundColor: headerPurple,
        body: SafeArea(
          bottom: false,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final scale = (w / _designWidth).clamp(0.85, 1.15);
              final horizontal = 14.0 * scale;
              final avatarD = (109 * scale).clamp(88.0, 120.0);

              return Column(
                children: [
                  SizedBox(height: 8 * scale),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(50 * scale),
                        ),
                        child: ColoredBox(
                          color: localTheme.colorScheme.surface,
                          child: LayoutBuilder(
                            builder: (context, inner) {
                              final contentW = inner.maxWidth;
                              return SingleChildScrollView(
                                padding: EdgeInsets.fromLTRB(
                                  horizontal,
                                  12 * scale,
                                  horizontal,
                                  32,
                                ),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    maxWidth: 520,
                                    minWidth: contentW,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      BusinessProfileIdentityRow(
                                        avatarUrl: data.avatarImageUrl,
                                        brandName: data.brandName,
                                        categoryLabel: data.categoryLabel,
                                        avatarDiameter: avatarD,
                                      ),
                                      SizedBox(height: 22 * scale),
                                      InkWell(
                                        borderRadius:
                                            BorderRadius.circular(12),
                                        onTap: onWebsiteTap,
                                        child: BusinessProfileTintedCard(
                                          title: data.websiteLabel,
                                          leading: FigmaAssetImage(
                                            url: data.websiteIconUrl,
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 16 * scale),
                                      BusinessProfileTintedCard(
                                        title: data.businessDetailsTitle,
                                        body: data.businessDetailsBody,
                                        showDivider: true,
                                      ),
                                      SizedBox(height: 22 * scale),
                                      BusinessProfileReviewsInstagramRow(
                                        reviewsIconUrl: data.reviewsIconUrl,
                                        instagramIconUrl:
                                            data.instagramIconUrl,
                                        onReviewsTap: onReviewsTap,
                                        onInstagramTap: onInstagramTap,
                                      ),
                                      SizedBox(height: 36 * scale),
                                      Text(
                                        data.emptyStateMessage,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleSmall
                                            ?.copyWith(
                                              fontWeight: FontWeight.w500,
                                              color: Theme.of(context)
                                                  .colorScheme
                                                  .onSurface
                                                  .withValues(alpha: 0.6),
                                            ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
