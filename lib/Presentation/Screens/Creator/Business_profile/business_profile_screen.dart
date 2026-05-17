import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';
import 'package:snappis/Presentation/Screens/Business/home/widgets/brand_bottom_nav.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  bool isInstagramSelected = false;

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

    return BusinessProfileSystemUi(
      child: Theme(
        data: localTheme,
        child: Scaffold(
          backgroundColor: headerPurple,
          extendBody: true,
          body: LayoutBuilder(
            builder: (context, constraints) {
              final w = constraints.maxWidth;
              final scale = (w / _designWidth).clamp(0.85, 1.15);
              final horizontal = 14.0 * scale;
              final avatarD = (109 * scale).clamp(88.0, 120.0);

              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildHeader(context, scale),
                  _buildMainContent(scale, horizontal, avatarD, localTheme),
                ],
              );
            },
          ),
          bottomNavigationBar: const BrandBottomNav(),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, double scale) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8 * scale),
        child: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.white,
                size: 20 * scale,
              ),
            ),
            Text(
              'Profile',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 18 * scale,
              ),
            ),
            const Spacer(),
            IconButton(
              onPressed: () => Get.toNamed('/Settings'),
              icon: Icon(
                Icons.menu_rounded,
                color: Colors.white,
                size: 20 * scale,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMainContent(
    double scale,
    double horizontal,
    double avatarD,
    ThemeData localTheme,
  ) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.only(top: 6 * scale),
        decoration: BoxDecoration(
          color: localTheme.colorScheme.surface,
          borderRadius: BorderRadius.vertical(top: Radius.circular(50 * scale)),
        ),
        clipBehavior: Clip.antiAlias,
        child: LayoutBuilder(
          builder: (context, inner) {
            return SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(
                horizontal,
                20 * scale,
                horizontal,
                24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  BusinessProfileIdentityRow(
                    avatarUrl:
                        'https://www.figma.com/api/mcp/asset/17147612-65a7-43de-9907-9178ae6e686a',
                    brandName: 'GUCCI',
                    categoryLabel: '(Cloth Shop)',
                    avatarDiameter: avatarD,
                    tagline:
                        'Gucci was founded in 1921 by Guccio Gucci (1881-1953) in Florence.',
                  ),
                  SizedBox(height: 20 * scale),
                  _buildWebsiteCard(scale),
                  SizedBox(height: 16 * scale),
                  BusinessProfileDetailFactsCard(
                    title: 'Business Details',
                    foundedLabel: 'Founded in 1921',
                    locationLabel: 'Florence',
                    fallbackBody: 'Founded in 1921 Location : Florence',
                  ),
                  SizedBox(height: 22 * scale),
                  _buildToggleRow(),
                  const SizedBox(height: 16),
                  _buildDynamicSection(scale),
                  const SizedBox(height: 120),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildWebsiteCard(double scale) {
    return BusinessProfileTintedCard(
      title: 'Website',
      minHeight: 53 * scale,
      leading: const Icon(Icons.language_rounded, color: Colors.black),
    );
  }

  Widget _buildToggleRow() {
    return BusinessProfileReviewsInstagramRow(
      reviewsIconUrl: '',
      instagramIconUrl: '',
      instagramHandle: '@gucci',
      isInstagramSelected: isInstagramSelected,
      onReviewsTap: () => setState(() => isInstagramSelected = false),
      onInstagramTap: () => setState(() => isInstagramSelected = true),
    );
  }

  Widget _buildDynamicSection(double scale) {
    if (isInstagramSelected) {
      return const ConnectInstagramSection();
    }
    return Column(
      children: [
        Divider(height: 40 * scale, color: Colors.grey.withOpacity(0.1)),
        BusinessProfileReviewsEmptyBlock(
          title: 'No Review found',
          subtitle: 'Reviews from creators will show up here once available.',
          scale: scale,
        ),
      ],
    );
  }
}
