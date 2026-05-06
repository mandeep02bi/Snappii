import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Presentation/bloc/applicationbloc.dart';
import 'package:snappis/Presentation/bloc/applicationevent.dart';
import 'package:snappis/Presentation/bloc/applicationstate.dart';

class Creatorcampaigntracking extends StatefulWidget {
  const Creatorcampaigntracking({super.key});

  @override
  State<Creatorcampaigntracking> createState() => _CreatorcampaigntrackingState();
}

class _CreatorcampaigntrackingState extends State<Creatorcampaigntracking> {
     @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ApplicationBloc()..add(LoadApplications()),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: Row(
          children: [
            // _buildSidebar(),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.start,
                    children: [
                      _buildHeader(),
                      const SizedBox(height: 20),
                      const Text(
                        "Campaign Tracking & Overview",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight:
                                FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      _buildCreatorSummary(context),
                      const SizedBox(height: 30),
                      _buildCampaignOverview(),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _buildHeader() {
  return Row(
    mainAxisAlignment:
        MainAxisAlignment.spaceBetween,
    children: [
      SizedBox(
        width: 300,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search",
            prefixIcon:
                const Icon(Icons.search),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(12),
              borderSide:
                  BorderSide.none,
            ),
          ),
        ),
      ),
      ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor:
                Colors.green),
        onPressed: () {},
        child: const Text("Export CSV",style: TextStyle(color: Colors.white),),
      )
    ],
  );
}
// Widget _buildCreatorSummary() {
//   return Card(
    
//     shape: RoundedRectangleBorder(
//         borderRadius:
//             BorderRadius.circular(16)),
//     child: Padding(
//       padding: const EdgeInsets.all(20),
//       child:
//           Container(
//             color: Colors.white,
//             width: MediaQuery.of(context).size.width,

//             child: BlocBuilder<ApplicationBloc,
//                 ApplicationState>(
//                     builder: (context, state) {
//             return Container(
//                           width: MediaQuery.of(context).size.width,

//               child: DataTable(
//                 columns: const [
//                   DataColumn(
//                       label:
//                           Text("Creator Name")),
//                   DataColumn(
//                       label: Text(
//                           "Total Applications")),
//                   DataColumn(
//                       label: Text(
//                           "Applied Campaigns")),
//                 ],
//                 rows: state.creators
//                     .map(
//                       (c) => DataRow(
//                         cells: [
//                           DataCell(Text(
//                               c.creatorName)),
//                           DataCell(Text(c
//                               .totalApplications
//                               .toString())),
//                           DataCell(Text(
//                               c.appliedCampaigns
//                                   .join(", "))),
//                         ],
//                       ),
//                     )
//                     .toList(),
//               ),
//             );
//                     },
//                   ),
//           ),
//     ),
//   );
// }
Widget _buildCreatorSummary(BuildContext context) {
  return Card(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(16),
    ),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<ApplicationBloc, ApplicationState>(
          builder: (context, state) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width -100 , 
                  // subtract sidebar width if needed
                ),
                child: DataTable(
                  columnSpacing: 5,
                  headingRowColor: MaterialStateProperty.all(
                    const Color(0xfff2f4f7),
                  ),
                  columns: const [
                    DataColumn(label: Text("Creator Name")),
                    DataColumn(label: Text("Total Applications")),
                    DataColumn(label: Text("Applied Campaigns")),
                  ],
                  rows: state.creators.map(
                    (c) => DataRow(
                      cells: [
                        DataCell(Text(c.creatorName)),
                        DataCell(Text(c.totalApplications.toString())),
                        DataCell(
                          Text(
                            c.appliedCampaigns.join(", "),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ).toList(),
                ),
              ),
            );
          },
        ),
      ),
    ),
  );
}

Widget _buildCampaignOverview() {
  return Card(
    shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(16)),
    child: Padding(
      padding: const EdgeInsets.all(20),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,

        child: ConstrainedBox(
           constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width - 120 , 
                  // subtract sidebar width if needed
                ),
          child: DataTable(
            columns: const [
              DataColumn(
                  label: Text("Brand Name")),
              DataColumn(
                  label:
                      Text("Total Applicants")),
              DataColumn(
                  label: Text(
                      "Application Status")),
            ],
            rows: const [
              DataRow(cells: [
                DataCell(Text(
                    "Apex Corp - Summer 2026")),
                DataCell(Text("120")),
                DataCell(Text("Approved")),
              ]),
              DataRow(cells: [
                DataCell(Text(
                    "Innovate LLC")),
                DataCell(Text("80")),
                DataCell(Text("Pending")),
              ]),
            ],
          ),
        ),
      ),
    ),
  );
}
}