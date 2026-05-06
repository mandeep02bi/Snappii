import 'package:flutter/material.dart';
import 'package:snappis/Data/DataSources/loginHistorydatasource.dart';
import 'package:snappis/Data/Models/Login_model.dart';

class Employeeuserlog extends StatefulWidget {
  const Employeeuserlog({super.key});

  @override
  State<Employeeuserlog> createState() => _EmployeeuserlogState();
}

class _EmployeeuserlogState extends State<Employeeuserlog> {
   final int rowsPerPage = 10;

  final List<LoginHistoryModel> history = List.generate(
    15,
    (i) => LoginHistoryModel(
      id: i + 1,
      userName: "Company",
      email: "company@example.com",
      ip: i.isEven ? "223.185.57.145" : "103.227.70.237",
      location: "India",
      device: "Chrome on Linux\nDesktop",
      role: "company",
      time: "2026-02-10 14:${10 + i}",
    ),
  );

  @override
  Widget build(BuildContext context) {
      late final effectiveRowsPerPage =
    rowsPerPage > history.length ? history.length : rowsPerPage;
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          padding: const EdgeInsets.all(24),
          color: const Color(0xFFF9FAFB),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// BREADCRUMB
              const Text(
                "Dashboard  >  Users  >  Login History",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 12),

              /// TITLE
              const Text(
                "Creator's Login History",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              /// SEARCH BAR
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFE5E7EB)),
                ),
                child: Row(
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search...",
                          prefixIcon: Icon(Icons.search),
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF10B981),
                      ),
                      onPressed: () {},
                      icon: const Icon(Icons.search),
                      label: const Text("Search"),
                    ),
                    const Spacer(),
                    const Text("Per Page: "),
                    DropdownButton(
                      value: 10,
                      items: [
                        DropdownMenuItem(value: 10, child: Text("10")),
                        DropdownMenuItem(value: 25, child: Text("25")),
                      ],
                      onChanged: null,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              /// ✅ FIXED HEIGHT TABLE (NO OVERFLOW)
              Expanded(
                child: SizedBox(
                              width: MediaQuery.of(context).size.width,

                  height: constraints.maxHeight - 260,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: const BorderSide(color: Color(0xFFE5E7EB)),
                    ),
                    child: Theme(
                      data: Theme.of(context).copyWith(
                        dividerColor: const Color(0xFFE5E7EB),
                        dataTableTheme: const DataTableThemeData(
                          headingRowColor:
                              MaterialStatePropertyAll(Color(0xFFF9FAFB)),
                        ),
                      ),
                        child: SingleChildScrollView(
                          child: PaginatedDataTable(
                                              
                                              showCheckboxColumn: false,
                                              rowsPerPage: effectiveRowsPerPage,
                                              availableRowsPerPage: const [10, 25],
                                              headingRowHeight: 56,
                                              dataRowHeight: 90,
                                              horizontalMargin: 16,
                                              columnSpacing: 28,
                          columns: const [
                            DataColumn(label: Text("#")),
                            DataColumn(label: Text("User")),
                            DataColumn(label: Text("IP Address")),
                            DataColumn(label: Text("Location & Device")),
                            DataColumn(label: Text("Role")),
                            DataColumn(label: Text("Time")),
                            DataColumn(label: Text("Actions")),
                          ],
                          source: LoginHistoryDataSource(history),
                                                ),
                        ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}