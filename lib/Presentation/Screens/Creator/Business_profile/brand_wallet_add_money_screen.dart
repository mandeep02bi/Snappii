import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:snappis/Presentation/Screens/Creator/Business_profile/widgets/business_profile_widgets.dart';

class BrandWalletAddMoneyScreen extends StatefulWidget {
  const BrandWalletAddMoneyScreen({super.key});

  @override
  State<BrandWalletAddMoneyScreen> createState() =>
      _BrandWalletAddMoneyScreenState();
}

class _BrandWalletAddMoneyScreenState extends State<BrandWalletAddMoneyScreen> {
  static const _balance = 200.45;
  static const _presets = [5000, 1000, 10000, 15000];

  late final TextEditingController _amountCtrl;
  int? _selectedPreset;

  @override
  void initState() {
    super.initState();
    _amountCtrl = TextEditingController(text: '5000');
    _selectedPreset = 5000;
    _amountCtrl.addListener(_onAmountChanged);
  }

  void _onAmountChanged() {
    final value = int.tryParse(
      _amountCtrl.text.replaceAll(RegExp(r'[^0-9]'), ''),
    );
    if (value != _selectedPreset) {
      setState(() => _selectedPreset = null);
    }
  }

  @override
  void dispose() {
    _amountCtrl.removeListener(_onAmountChanged);
    _amountCtrl.dispose();
    super.dispose();
  }

  void _selectPreset(int amount) {
    setState(() {
      _selectedPreset = amount;
      _amountCtrl.text = amount.toString();
    });
  }

  void _onProceed() {
    Get.snackbar(
      'Payment',
      'Proceeding to pay ₹${_amountCtrl.text}...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.white,
      colorText: Colors.black87,
    );
  }

  @override
  Widget build(BuildContext context) {
    return LightBackgroundSystemUi(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Stack(
            children: [
              // Bottom Layer: Header and Balance Card
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    BrandSubPageHeader(
                      title: 'My Wallet',
                      onBack: Get.back,
                      titleColor: BrandWalletTheme.headerPurple,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 12, 15, 0),
                      child: BrandWalletBalanceCard(
                        balance: _balance,
                        showAddMoneyButton: true,
                        onAddMoney: () {},
                      ),
                    ),
                  ],
                ),
              ),
              // Top Layer: Overlapping Curved Sheet
              Positioned(
                top: 185, // Perfectly overlaps the balance card's bottom
                left: 0,
                right: 0,
                bottom: 0,
                child: ClipPath(
                  clipper: AddMoneySheetClipper(),
                  child: Container(
                    color: BrandWalletTheme.sheetBackground,
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(20, 12, 20, 24),
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          const SizedBox(height: 12),
                          Center(
                            child: Container(
                              width: 41,
                              height: 4,
                              decoration: BoxDecoration(
                                color: Colors.black.withValues(alpha: 0.8),
                                borderRadius: BorderRadius.circular(2),
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          const Text(
                            'Add Money',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Enter Amount',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 8),
                          _AmountField(controller: _amountCtrl),
                          const SizedBox(height: 24),
                          const Text(
                            'Choose amount',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          const SizedBox(height: 16),
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            mainAxisSpacing: 17,
                            crossAxisSpacing: 17,
                            childAspectRatio: 120 / 46,
                            children: [
                              for (final amount in _presets)
                                BrandWalletAmountChip(
                                  amount: amount,
                                  selected: _selectedPreset == amount,
                                  onTap: () => _selectPreset(amount),
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const BrandWalletInfoBox(),
                          const SizedBox(height: 28),
                          BrandWalletGradientButton(
                            label: 'Proceed to Pay',
                            onPressed: _onProceed,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AmountField extends StatelessWidget {
  const _AmountField({required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
      decoration: InputDecoration(
        prefixText: '₹ ',
        prefixStyle: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 14,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: BrandWalletTheme.chipBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: BrandWalletTheme.headerPurple),
        ),
      ),
    );
  }
}

class AddMoneySheetClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    final w = size.width;
    final h = size.height;

    // We want the tab to be in the center
    final tabStart = w * 0.28;
    final tabEnd = w * 0.72;
    final tabTopStart = w * 0.38;
    final tabTopEnd = w * 0.62;

    const flatY = 40.0;
    const topY = 0.0;
    const cornerRadius = 24.0; // rounded corners for the flat left/right edges

    path.moveTo(0, h);
    path.lineTo(0, flatY + cornerRadius);

    // Top-left corner of the sheet
    path.quadraticBezierTo(0, flatY, cornerRadius, flatY);

    // Left flat edge
    path.lineTo(tabStart, flatY);

    // Curve up to the central tab (dome shape)
    path.cubicTo(
      tabStart + 15,
      flatY, // control point 1
      tabTopStart - 5,
      topY, // control point 2
      tabTopStart,
      topY, // end point
    );

    // Top flat edge of the tab
    path.lineTo(tabTopEnd, topY);

    // Curve down from the central tab
    path.cubicTo(
      tabTopEnd + 5,
      topY, // control point 1
      tabEnd - 15,
      flatY, // control point 2
      tabEnd,
      flatY, // end point
    );

    // Right flat edge
    path.lineTo(w - cornerRadius, flatY);

    // Top-right corner of the sheet
    path.quadraticBezierTo(w, flatY, w, flatY + cornerRadius);

    path.lineTo(w, h);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => false;
}
