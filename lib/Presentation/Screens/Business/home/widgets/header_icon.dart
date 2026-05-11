import 'package:flutter/material.dart';

class HeaderIcon extends StatelessWidget {
  final IconData icon;
  const HeaderIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.black12),
      ),
      child: Icon(icon, size: 22, color: Colors.black87),
    );
  }
}
