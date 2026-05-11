import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snappis/Domains/Entities/Creator_entities.dart';
import 'package:snappis/Presentation/Screens/Business/Campaign/Master_Campaign/Profile_Campaign.dart';
import 'package:snappis/Presentation/bloc/booking_bloc.dart';
import 'package:snappis/Presentation/bloc/creator_details_bloc.dart';

class CreatorCard extends StatelessWidget {
  final CreatorEntity creator;
  const CreatorCard({super.key, required this.creator});

 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.black26),
      ),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundImage: AssetImage(creator.imageUrl),
          ),
          const SizedBox(height: 8),
          Text(
            creator.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            creator.category,
            style: const TextStyle(color: Colors.grey),
          ),
          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text("${creator.followers}"),
                  const Text("Fallowers",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
              Column(
                children: [
                  Text("${creator.avgViews}"),
                  const Text("Avg.Views",
                      style: TextStyle(fontSize: 12, color: Colors.grey)),
                ],
              ),
            ],
          ),

          const SizedBox(height: 10),

          Align(
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () {
                //  Navigator.of(context).push(
                //     MaterialPageRoute(
                //       builder: (_) => const ProfilCamp(),
                //       ),
                //     ); 

                Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MultiBlocProvider(
                    providers: [
                      BlocProvider(
                        create: (_) => CreatorDetailBloc()
                          ..add(FetchCreatorDetail(creator.id)),
                      ),
                      BlocProvider(
                        create: (_) => BookingBloc(),
                      ),
                    ],
                    child: ProfilCamp(creatorId: creator.id),
                  ),
                ),
              );
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 26, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.green.shade400,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text("View",
                    style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}