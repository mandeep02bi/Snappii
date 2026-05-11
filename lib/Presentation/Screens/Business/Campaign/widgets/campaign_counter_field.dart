import 'package:flutter/material.dart';

class CampaignCounterField extends StatefulWidget {
  final int initialValue;
  final ValueChanged<int>? onChanged;

  const CampaignCounterField({
    super.key,
    this.initialValue = 1,
    this.onChanged,
  });

  @override
  State<CampaignCounterField> createState() => _CampaignCounterFieldState();
}

class _CampaignCounterFieldState extends State<CampaignCounterField> {
  late int value;

  @override
  void initState() {
    super.initState();
    value = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: const Icon(Icons.remove, color: Colors.black87, size: 20),
            onPressed: () {
              if (value > 1) {
                setState(() => value--);
                widget.onChanged?.call(value);
              }
            },
          ),
          const SizedBox(width: 20),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              color: const Color(0xFFE1D0FF).withOpacity(0.55),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFFC0C0C0), width: 1),
            ),
            child: Center(
              child: Text(
                "$value",
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF9136F3),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black87, size: 20),
            onPressed: () {
              setState(() => value++);
              widget.onChanged?.call(value);
            },
          ),
        ],
      ),
    );
  }
}
