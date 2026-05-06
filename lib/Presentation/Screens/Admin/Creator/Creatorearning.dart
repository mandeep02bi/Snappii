import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Domains/Entities/Transaction_entity.dart';
import 'package:snappis/Presentation/Widgets/Admin/Summary_card.dart';
import 'package:snappis/Presentation/Widgets/Admin/transaction.dart';

class Creatorearning extends StatefulWidget {
  const Creatorearning({super.key});

  @override
  State<Creatorearning> createState() => _CreatorearningState();
}

class _CreatorearningState extends State<Creatorearning> {
 
  @override
  Widget build(BuildContext context) {
    final transactions = List.generate(
      25,
      (index) => TransactionEntity(
        id: "#TXN-${9900 + index}",
        company: "Apex Corp.",
        date: "Feb 11, 2026",
        amount: 1200.00 + index,
        status: index % 3 == 0
            ? "Completed"
            : index % 3 == 1
                ? "Pending"
                : "Failed",
      ),
    );

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Row(
        children: [
          /// Sidebar
          // Container(
          //   width: 240,
          //   color: AppColors.sidebar,
          //   child: const Padding(
          //     padding: EdgeInsets.all(20),
          //     child: Column(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Text("Brand Transactions",
          //             style: TextStyle(
          //                 fontWeight: FontWeight.bold)),
          //       ],
          //     ),
          //   ),
          // ),

          /// Main Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Bar
                  Row(
                    mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Creator Earning History",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold),
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              AppColors.primary,
                        ),
                        onPressed: () {},
                        child:
                            const Text("Export Report", style: TextStyle(color: Colors.white),),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Summary
                  const Row(
                    children: [
                      SummaryCard(
                          title: "Total Volume",
                          value: "\$8,450.00"),
                      SizedBox(width: 16),
                      SummaryCard(
                          title: "Pending Settlements",
                          value: "\$320.00"),
                      SizedBox(width: 16),
                      SummaryCard(
                          title: "Last 30 Days",
                          value: "124 Transactions"),
                    ],
                  ),

                  const SizedBox(height: 20),

                  /// Scrollable Table
                  TransactionTable(
                      transactions: transactions),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}