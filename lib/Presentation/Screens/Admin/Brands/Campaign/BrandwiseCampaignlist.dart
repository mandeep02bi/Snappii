import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/Campaign/AddBrandCampaign.dart';
import 'package:snappis/Presentation/Widgets/Admin/AdminPannel.dart';
import 'package:snappis/Presentation/Widgets/Admin/Servicetable.dart';
import 'package:snappis/Presentation/bloc/servicebloc.dart';

class Brandwisecampaignlist extends StatefulWidget {
    final Function(AdminPage) onNavigate;

  const Brandwisecampaignlist({super.key, required this.onNavigate, });

  @override
  State<Brandwisecampaignlist> createState() => _BrandwisecampaignlistState();
}

class _BrandwisecampaignlistState extends State<Brandwisecampaignlist> {
 
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ServiceBloc()..add(LoadServices()),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Brand Wise Campaign List",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) =>
                          const Addbrandcampaign(),
                    );
                  },
                  child: const Text("Add Brand Campaign"),
                )
              ],
            ),

            const SizedBox(height: 20),

            /// Scrollable Table
            BlocBuilder<ServiceBloc, ServiceState>(
              builder: (context, state) {
                return Expanded(
                  child: ServiceTable(
                    services: state.services,
                    onRowTap: (service) {
                      /// Navigate inside AdminDashboard
                      // final stateful =
                      //     context.findAncestorStateOfType<
                      //         _AdmindashboardState>();

                      // stateful?.setState(() {
                      //   stateful.selectedPage =
                      //       AdminPage.campaigndetails;
                      // });
                       widget.onNavigate(AdminPage.campaigndetails);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  // @override
  // Widget build(BuildContext context) {
  //   return BlocProvider(
  //     create: (_) => ServiceBloc()..add(LoadServices()),
  //     child: Scaffold(
  //       backgroundColor: AppColors.background,
  //       body: Row(
  //         children: [
  //           /// Sidebar
  //           Container(
  //             width: 240,
  //             color: AppColors.white,
  //             child: const Padding(
  //               padding: EdgeInsets.all(20),
  //               child: Text(
  //                 "Brand Campaign",
  //                 style: TextStyle(
  //                     fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),

  //           /// Main Content
  //           Expanded(
  //             child: Padding(
  //               padding: const EdgeInsets.all(24),
  //               child: Column(
  //                 crossAxisAlignment:
  //                     CrossAxisAlignment.start,
  //                 children: [
  //                   /// Header
  //                   Row(
  //                     mainAxisAlignment:
  //                         MainAxisAlignment
  //                             .spaceBetween,
  //                     children: [
  //                       const Text(
  //                         "Campaign Service List",
  //                         style: TextStyle(
  //                             fontSize: 22,
  //                             fontWeight:
  //                                 FontWeight.bold),
  //                       ),
  //                        ElevatedButton.icon(
  //                         style: ElevatedButton.styleFrom(
  //                           backgroundColor: const Color(0xFF10B981),
  //                         ),
  //                         onPressed: () {},
  //                         // icon: const Icon(Icons.save),
  //                         label: const Text("Add Campaign"),
  //                       ),
  //                     ],
  //                   ),

  //                   const SizedBox(height: 20),

  //                   const SearchField(),

  //                   const SizedBox(height: 20),

  //                   /// Scrollable Table
  //                   BlocBuilder<ServiceBloc,
  //                       ServiceState>(
  //                     builder: (context, state) {
  //                       return ServiceTable(
  //                         services:
  //                             state.services,
  //                       );
  //                     },
  //                   )
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }
}