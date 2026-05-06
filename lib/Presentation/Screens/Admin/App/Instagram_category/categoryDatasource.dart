import 'package:flutter/material.dart';

// ignore: unused_element
class CategoryDataSource extends DataTableSource {
  final List categories;

  CategoryDataSource(this.categories);

  @override
  DataRow getRow(int index) {
    final item = categories[index];

    return DataRow(cells: [
      DataCell(Text("${index + 1}")),
      DataCell(Row(
        children: [
          const SizedBox(width: 10),
          Text(item.name),
        ],
      )),
      DataCell(Text(item.abbreviation)),
      const DataCell(Row(
        children: [

          SizedBox(width: 10),
          Icon(Icons.edit, color: Colors.orange),

          SizedBox(width: 10),
          Icon(Icons.delete, color: Colors.red),
        ],
      )),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => categories.length;

  @override
  int get selectedRowCount => 0;
}
