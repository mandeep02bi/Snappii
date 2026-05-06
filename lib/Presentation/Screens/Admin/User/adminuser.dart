import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Data/Models/membermodel.dart';
import 'package:snappis/Presentation/Binding/members_data_source.dart';
import 'package:snappis/Presentation/Screens/Admin/User/Addbranduser.dart';
import 'package:snappis/Presentation/Widgets/Admin/AdminPannel.dart';

class Adminuser extends StatefulWidget {
    final VoidCallback onUserLogs;

  const Adminuser({super.key, required this.onUserLogs});

  @override
  State<Adminuser> createState() => _AdminuserState();
}

class _AdminuserState extends State<Adminuser> {
  int rowsPerPage = 10;

AdminPage selectedPage = AdminPage.branduser; 
  final List<MemberModel> members = [
    MemberModel(
      id: 1,
      name: "Team Member",
      email: "team.member_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),

    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 1,
      name: "Team Member",
      email: "team.member_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),

    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
    MemberModel(
      id: 2,
      name: "Assistant",
      email: "assistant_2@example.com",
      role: "Team Member",
      status: "Active",
      joined: "2026-02-03",
    ),
  ];

  late final effectiveRowsPerPage =
    rowsPerPage > members.length ? members.length : rowsPerPage;
@override
Widget build(BuildContext context) {
  return Container(
    color: const Color(0xFFF9FAFB), // ✅ same as design
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// HEADER
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Admin Users",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                OutlinedButton.icon(
                  // onPressed: () {
                  //   print("page 2");
                  //     setState(() => selectedPage = AdminPage.userlogs);


                  // },
                  onPressed: widget.onUserLogs,
                  icon: const Icon(Icons.remove_red_eye),
                  label: const Text("User Logs"),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary1,
                  ),
                  onPressed: () => showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (_) => const AddUserDialog(),
                  ),
                  icon: const Icon(Icons.add, color: Colors.white,),
                  label: const Text("Add User",style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ],
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// SEARCH + FILTER
        // SingleChildScrollView(
        //   scrollDirection: Axis.vertical,
        Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppColors.border),
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "Search...",
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                  label: const Text("Search"),
                ),
                const SizedBox(width: 12),
                OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_list),
                  label: const Text("Filters"),
                ),
                const Spacer(),
                const Text("Per Page: "),
                DropdownButton<int>(
                  value: rowsPerPage,
                  items: const [
                    DropdownMenuItem(value: 10, child: Text("10")),
                    DropdownMenuItem(value: 25, child: Text("25")),
                  ],
                  onChanged: (v) {
                    if (v != null) setState(() => rowsPerPage = v);
                  },
                ),
              ],
            ),
          ),
        // ),

        const SizedBox(height: 16),

        /// ✅ TABLE (NOW FIXED)
        Expanded(
          child: Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: const Color(0xFFE5E7EB)),
            ),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Theme(
                data: Theme.of(context).copyWith(
                  cardColor: Colors.white,
                  dividerColor: const Color(0xFFE5E7EB),
                  dataTableTheme: const DataTableThemeData(
                    headingRowColor:
                        MaterialStatePropertyAll(Color(0xFFF9FAFB)),
                    dataRowColor:
                        MaterialStatePropertyAll(Colors.white),
                  ),
                ),
                child: PaginatedDataTable(
                  
                  showCheckboxColumn: false,
                  rowsPerPage: effectiveRowsPerPage,
                  availableRowsPerPage: const [10, 25],
                  headingRowHeight: 56,
                  dataRowHeight: 64,
                  horizontalMargin: 16,
                  columnSpacing: 28,
                  columns: const [
                    DataColumn(label: Text("#")),
                    DataColumn(label: Text("Name")),
                    // DataColumn(label: Text("Roles")),
                    DataColumn(label: Text("Status")),
                    DataColumn(label: Text("Joined")),
                    DataColumn(label: Text("Actions")),
                  ],
                  source: MembersDataSource(members),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

}