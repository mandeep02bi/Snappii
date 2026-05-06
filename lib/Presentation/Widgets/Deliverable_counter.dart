import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class DeliverableCounter extends StatefulWidget {
  final String title;

  const DeliverableCounter({super.key, required this.title});

  @override
  State<DeliverableCounter> createState() => _DeliverableCounterState();
}

class _DeliverableCounterState extends State<DeliverableCounter> {
  int value = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(child: Text(widget.title)),
          _btn(Icons.remove, () {
            if (value > 0) setState(() => value--);
          }),
          const SizedBox(width: 10),
          Text("$value"),
          const SizedBox(width: 10),
          _btn(Icons.add, () {
            setState(() => value++);
          }),
        ],
      ),
    );
  }

  Widget _btn(IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.primary),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 16, color: AppColors.primary),
      ),
    );
  }
}
