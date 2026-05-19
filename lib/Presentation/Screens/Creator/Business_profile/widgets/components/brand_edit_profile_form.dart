import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_avatar.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_disclaimer_box.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_labeled_field.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_section_title.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_update_button.dart';

/// Scrollable form body — isolated from header to limit rebuild scope.
class BrandEditProfileForm extends StatelessWidget {
  const BrandEditProfileForm({
    super.key,
    required this.businessNameCtrl,
    required this.categoryCtrl,
    required this.foundedCtrl,
    required this.bioCtrl,
    required this.websiteCtrl,
    required this.officeLocationCtrl,
    required this.gstinCtrl,
    required this.panCtrl,
    required this.addressCtrl,
    required this.postalCodeCtrl,
    required this.onUpdate,
    this.onAvatarEdit,
  });

  final TextEditingController businessNameCtrl;
  final TextEditingController categoryCtrl;
  final TextEditingController foundedCtrl;
  final TextEditingController bioCtrl;
  final TextEditingController websiteCtrl;
  final TextEditingController officeLocationCtrl;
  final TextEditingController gstinCtrl;
  final TextEditingController panCtrl;
  final TextEditingController addressCtrl;
  final TextEditingController postalCodeCtrl;
  final VoidCallback onUpdate;
  final VoidCallback? onAvatarEdit;

  static const _gap = SizedBox(height: 16);
  static const _sectionGap = SizedBox(height: 32);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SizedBox(height: 8),
          BrandEditProfileAvatar(onEditTap: onAvatarEdit),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const BrandEditProfileSectionTitle('Basic Information')],
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Business Name',
            controller: businessNameCtrl,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Business Category',
            controller: categoryCtrl,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Founded',
            controller: foundedCtrl,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Bio',
            controller: bioCtrl,
            maxLines: 3,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Website',
            controller: websiteCtrl,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Office Location',
            controller: officeLocationCtrl,
          ),
          _sectionGap,
          const BrandEditProfileSectionTitle('Business Details'),
          _gap,
          const BrandEditProfileDisclaimerBox(),
          _gap,
          BrandEditProfileLabeledField(label: 'GSTIN', controller: gstinCtrl),
          _gap,
          BrandEditProfileLabeledField(label: 'PAN', controller: panCtrl),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Address Details',
            controller: addressCtrl,
            maxLines: 4,
            minHeight: 84,
          ),
          _gap,
          BrandEditProfileLabeledField(
            label: 'Postal Code',
            controller: postalCodeCtrl,
          ),
          _sectionGap,
          BrandEditProfileUpdateButton(onPressed: onUpdate),
          const SizedBox(height: 24),
        ],
      ),
    );
  }
}
