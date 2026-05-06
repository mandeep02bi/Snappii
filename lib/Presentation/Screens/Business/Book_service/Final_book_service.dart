import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Presentation/Widgets/Book_service_card.dart';
import 'package:snappis/Presentation/Widgets/SecPrimar_btn.dart';

class FinalBookService extends StatefulWidget {
  const FinalBookService({super.key});

  @override
  State<FinalBookService> createState() => _FinalBookServiceState();
}

class _FinalBookServiceState extends State<FinalBookService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            children: [
              /// Header
              Row(
                children: const [
                  CircleAvatar(
                    radius: 18,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  Spacer(),
                  Text(
                    "Book Service",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Spacer(flex: 2),
                ],
              ),

              const SizedBox(height: 24),

              /// Service card
              ServiceCard(),

              const Spacer(),

              /// CTA
              SecprimarBtn(
                text: "Book Now",
                onPressed: () {
                  // Navigate to payment gateway
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}