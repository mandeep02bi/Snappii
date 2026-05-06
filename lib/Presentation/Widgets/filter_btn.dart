import 'package:flutter/material.dart';

class FilterBtn extends StatelessWidget {
  const FilterBtn({super.key});

   @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: const [
          Icon(Icons.filter_list, size: 18),
          SizedBox(width: 6),
          Text("Filter", style: TextStyle(fontSize: 14)),
        ],
      ),
    );
  }
}