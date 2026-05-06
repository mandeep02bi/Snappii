import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Data/Models/membermodel.dart';

class MembersDataSource extends DataTableSource {
  final List<MemberModel> data;

  MembersDataSource(this.data);

  @override
  DataRow getRow(int index) {
    final m = data[index];
    return DataRow.byIndex(
      index: index,
      cells: [
        DataCell(Text("${index + 1}")),
        DataCell(
          Row(
            children: [
              CircleAvatar(
                backgroundColor: AppColors.primary1,
                child: Text(m.name[0]),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(m.name, style: const TextStyle(fontWeight: FontWeight.w600)),
                  Text(m.email, style: const TextStyle(color: AppColors.textMuted1, fontSize: 12)),
                ],
              ),
            ],
          ),
        ),
        // DataCell(
        //   Chip(
        //     label: Text(m.role),
        //     backgroundColor: Colors.blue.shade50,
        //   ),
        // ),
        DataCell(
          Chip(
            label: Text(m.status),
            backgroundColor: Colors.green.shade50,
          ),
        ),
        DataCell(Text(m.joined)),
        DataCell(
          Row(
            children: const [
              Icon(Icons.remove_red_eye, color: Colors.blue),
              SizedBox(width: 12),
              Icon(Icons.edit, color: Colors.orange),
              SizedBox(width: 12),
              Icon(Icons.vpn_key, color: Colors.blue),
              SizedBox(width: 12),
              Icon(Icons.lock, color: Colors.orange),
              SizedBox(width: 12),
              Icon(Icons.delete, color: Colors.red),
            ],
          ),
        ),
      ],
    );
  }

  @override
  int get rowCount => data.length;

  @override
  bool get isRowCountApproximate => false;

  @override
  int get selectedRowCount => 0;
}
