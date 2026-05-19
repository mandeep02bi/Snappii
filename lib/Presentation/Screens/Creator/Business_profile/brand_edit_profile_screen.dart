import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_form.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_header.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/components/brand_edit_profile_theme.dart';

class BrandEditProfileScreen extends StatefulWidget {
  const BrandEditProfileScreen({super.key});

  @override
  State<BrandEditProfileScreen> createState() => _BrandEditProfileScreenState();
}

class _BrandEditProfileScreenState extends State<BrandEditProfileScreen> {
  late final TextEditingController _businessNameCtrl;
  late final TextEditingController _categoryCtrl;
  late final TextEditingController _foundedCtrl;
  late final TextEditingController _bioCtrl;
  late final TextEditingController _websiteCtrl;
  late final TextEditingController _officeLocationCtrl;
  late final TextEditingController _gstinCtrl;
  late final TextEditingController _panCtrl;
  late final TextEditingController _addressCtrl;
  late final TextEditingController _postalCodeCtrl;

  @override
  void initState() {
    super.initState();
    _businessNameCtrl = TextEditingController(text: 'GUCCI');
    _categoryCtrl = TextEditingController(text: 'Cloth Shop');
    _foundedCtrl = TextEditingController(text: '1921');
    _bioCtrl = TextEditingController(
      text:
          'Gucci was founded in 1921 by Guccio Gucci (1881-1953) in Florence.',
    );
    _websiteCtrl = TextEditingController();
    _officeLocationCtrl = TextEditingController(text: 'Florence');
    _gstinCtrl = TextEditingController();
    _panCtrl = TextEditingController();
    _addressCtrl = TextEditingController();
    _postalCodeCtrl = TextEditingController();
  }

  @override
  void dispose() {
    _businessNameCtrl.dispose();
    _categoryCtrl.dispose();
    _foundedCtrl.dispose();
    _bioCtrl.dispose();
    _websiteCtrl.dispose();
    _officeLocationCtrl.dispose();
    _gstinCtrl.dispose();
    _panCtrl.dispose();
    _addressCtrl.dispose();
    _postalCodeCtrl.dispose();
    super.dispose();
  }

  void _onUpdate() {
    Get.snackbar(
      'Profile Updated',
      'Your business profile has been saved.',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black87,
    );
    Get.back();
  }

  @override
  Widget build(BuildContext context) {
    final base = Theme.of(context);

    return LightBackgroundSystemUi(
      child: Theme(
        data: base.copyWith(
          inputDecorationTheme: BrandEditProfileTheme.inputDecorationTheme,
        ),
        child: Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                BrandEditProfileHeader(onBack: Get.back),
                Expanded(
                  child: BrandEditProfileForm(
                    businessNameCtrl: _businessNameCtrl,
                    categoryCtrl: _categoryCtrl,
                    foundedCtrl: _foundedCtrl,
                    bioCtrl: _bioCtrl,
                    websiteCtrl: _websiteCtrl,
                    officeLocationCtrl: _officeLocationCtrl,
                    gstinCtrl: _gstinCtrl,
                    panCtrl: _panCtrl,
                    addressCtrl: _addressCtrl,
                    postalCodeCtrl: _postalCodeCtrl,
                    onUpdate: _onUpdate,
                    onAvatarEdit: () {},
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
