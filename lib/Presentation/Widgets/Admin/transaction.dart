import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Transaction_entity.dart';
import 'package:snappis/Presentation/Widgets/Admin/Status_badage.dart';


class TransactionTable extends StatelessWidget {
  final List<TransactionEntity> transactions;

  const TransactionTable({super.key, required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.card,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          children: [
            _header(),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: transactions.length,
                itemBuilder: (context, index) {
                  final tx = transactions[index];
                  return Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 14),
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(color: AppColors.border),
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(flex: 2, child: Text(tx.id)),
                        Expanded(flex: 2, child: Text(tx.company)),
                        Expanded(flex: 2, child: Text(tx.date)),
                        Expanded(
                            child: Text(
                                "\$${tx.amount.toStringAsFixed(2)}")),
                        Expanded(child: StatusBadge(status: tx.status)),
                        const Expanded(
                            child: Text("View Details",
                                style: TextStyle(
                                    color: Colors.blue))),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      padding:
          const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: const Row(
        children: [
          Expanded(flex: 2, child: Text("Transaction ID")),
          Expanded(flex: 2, child: Text("Company")),
          Expanded(flex: 2, child: Text("Date")),
          Expanded(child: Text("Amount")),
          Expanded(child: Text("Status")),
          Expanded(child: Text("Action")),
        ],
      ),
    );
  }
}
