import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Screens/Admin/Brands/Campaign/AddBrandCampaign.dart';
import 'package:snappis/Presentation/Widgets/Admin/AdminPannel.dart';
import 'package:snappis/Presentation/Widgets/Admin/Brand_card.dart';
import 'package:snappis/Presentation/bloc/Brandbloc.dart';

class Brandcampaign extends StatefulWidget {
    final Function(AdminPage) onNavigate;

  const Brandcampaign({super.key,required this.onNavigate,});

  @override
  State<Brandcampaign> createState() => _BrandcampaignState();
}

class _BrandcampaignState extends State<Brandcampaign> {
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => BrandBloc()..add(LoadBrands()),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: Row(
          children: [
            /// Sidebar
            Container(
              width: 240,
              color: AppColors.white,
              child: const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "Brand Campaign",
                  style: TextStyle(
                      fontWeight:
                          FontWeight.bold),
                ),
              ),
            ),

            /// Main Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start,
                  children: [
                    /// Header
                    Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        const Text(
                          "Brand List",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight:
                                  FontWeight.bold),
                        ),
                        ElevatedButton(
                          style: ElevatedButton
                              .styleFrom(
                            backgroundColor:
                                AppColors.green,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (_) =>
                                  const Addbrandcampaign(),
                            );
                          },
                          child: const Text(
                              "Add New Campaign"),
                        )
                      ],
                    ),

                    const SizedBox(height: 20),

                    const SearchBar(),

                    const SizedBox(height: 20),

                    /// Scrollable Grid
                    Expanded(
                      child: BlocBuilder<BrandBloc,BrandState>(
                          builder:
                              (context, state) {
                        return GridView.builder(
                          itemCount:
                              state.brands.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            crossAxisSpacing:
                                20,
                            mainAxisSpacing:
                                20,
                            childAspectRatio:
                                1.3,
                          ),
                          itemBuilder:
                              (context, index) {
                            return GestureDetector(
                              onTap: () {
                                widget.onNavigate(AdminPage.brandwisecampaignlist);
                              },
                              child: BrandCard(
                                brand: state
                                    .brands[index],
                              ),
                            );
                          },
                        );
                      }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}