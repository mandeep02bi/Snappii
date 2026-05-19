import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// Confirmation dialog — Figma node 514:1599.
class BrandDeleteAccountDialog extends StatelessWidget {
  const BrandDeleteAccountDialog({super.key});

  static const _cardWidth = 244.0;
  static const _cancelFill = Color(0xE3A774FF);
  static const _yesBorder = Color(0xFF9279FF);

  static Future<bool?> show() {
    return Get.dialog<bool>(
      const BrandDeleteAccountDialog(),
      barrierDismissible: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      insetPadding: const EdgeInsets.symmetric(horizontal: 40),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        clipBehavior: Clip.antiAlias,
        child: SizedBox(
          width: _cardWidth,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(22, 20, 22, 16),
                child: Text(
                  'Are you sure you want to delete your profile?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    height: 1.35,
                  ),
                ),
              ),
              Divider(height: 1, color: Colors.grey.withValues(alpha: 0.25)),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 14, 16, 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _DialogButton(
                        label: 'Cancel',
                        filled: true,
                        onTap: () => Get.back(result: false),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _DialogButton(
                        label: 'Yes',
                        filled: false,
                        onTap: () => Get.back(result: true),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DialogButton extends StatelessWidget {
  const _DialogButton({
    required this.label,
    required this.filled,
    required this.onTap,
  });

  final String label;
  final bool filled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: filled ? BrandDeleteAccountDialog._cancelFill : Colors.white,
      shape: StadiumBorder(
        side: filled
            ? BorderSide.none
            : const BorderSide(color: BrandDeleteAccountDialog._yesBorder),
      ),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: SizedBox(
          height: 32,
          child: Center(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: filled ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
