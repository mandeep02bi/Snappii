import 'package:flutter/material.dart';
import 'package:snappis/Data/Models/Login_model.dart';

class LoginHistoryDataSource extends DataTableSource {
  final List<LoginHistoryModel> data;

  LoginHistoryDataSource(this.data);

  @override
  DataRow getRow(int index) {
    final item = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text(item.id.toString())),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.userName, style: const TextStyle(fontWeight: FontWeight.w600)),
              Text(item.email, style: const TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        DataCell(Text(item.ip)),
        DataCell(
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(item.location),
              Text(item.device, style: const TextStyle(color: Colors.grey)),
              const Text("Lang: en", style: TextStyle(color: Colors.grey)),
            ],
          ),
        ),
        DataCell(
          Text(
            item.role,
            style: const TextStyle(color: Colors.green, fontWeight: FontWeight.w600),
          ),
        ),
        DataCell(Text(item.time)),
        const DataCell(
          Icon(Icons.remove_red_eye, color: Colors.blue),
        ),
      ],
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => data.length;

  @override
  int get selectedRowCount => 0;
}
