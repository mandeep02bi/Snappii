import 'package:flutter/foundation.dart';

/// View model for [BusinessProfileScreen] — maps from domain / API as needed.
@immutable
class BusinessProfileViewData {
  const BusinessProfileViewData({
    required this.brandName,
    required this.categoryLabel,
    required this.avatarImageUrl,
    required this.websiteLabel,
    required this.websiteIconUrl,
    required this.businessDetailsTitle,
    required this.businessDetailsBody,
    required this.reviewsIconUrl,
    required this.instagramIconUrl,
    this.emptyStateMessage = 'No Review found',
  });

  final String brandName;
  final String categoryLabel;
  final String avatarImageUrl;
  final String websiteLabel;
  final String websiteIconUrl;
  final String businessDetailsTitle;
  final String businessDetailsBody;
  final String reviewsIconUrl;
  final String instagramIconUrl;
  final String emptyStateMessage;

  /// Sample data matching Figma node `514:918` (replace URLs with your own assets before URLs expire).
  static BusinessProfileViewData figmaSample() {
    return const BusinessProfileViewData(
      brandName: 'GUCCI',
      categoryLabel: '(Cloth Shop)',
      avatarImageUrl:
          'https://www.figma.com/api/mcp/asset/17147612-65a7-43de-9907-9178ae6e686a',
      websiteLabel: 'Website',
      websiteIconUrl:
          'https://www.figma.com/api/mcp/asset/b8d08ddc-6b5e-49b9-8eeb-1dd4045779aa',
      businessDetailsTitle: 'Business Details',
      businessDetailsBody: 'Founded in 1921 Location : Florence',
      reviewsIconUrl:
          'https://www.figma.com/api/mcp/asset/4c38ead5-ae79-4171-a4e5-f62b3ac100c4',
      instagramIconUrl:
          'https://www.figma.com/api/mcp/asset/4a08c73b-9926-49d9-8498-4b1750946285',
    );
  }
}
