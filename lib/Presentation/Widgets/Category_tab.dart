import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.selectedIndex, required this.items, required this.onTap});
  final int selectedIndex;
  final List<String> items;
  final Function(int) onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        items.length,
        (i) => GestureDetector(
          onTap: () => onTap(i),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 6, vertical: 10),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            decoration: BoxDecoration(
              color: selectedIndex == i ? AppColors.purple : Colors.white,
              border: Border.all(color: Colors.black26),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Text(
              items[i],
              style: TextStyle(
                color: selectedIndex == i ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}