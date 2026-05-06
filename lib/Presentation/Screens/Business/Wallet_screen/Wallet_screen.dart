import 'package:flutter/material.dart';
import 'package:snappis/Presentation/Screens/Business/Wallet_screen/Withdraw_screen.dart';
import 'package:snappis/Presentation/Widgets/Balance_card.dart';
import 'package:snappis/Presentation/Widgets/Primary_btn.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({super.key});

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),

              Row(
                children: const [
                  Icon(Icons.arrow_back, size: 26),
                  SizedBox(width: 10),
                  Text(
                    "Wallet",
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),

              const SizedBox(height: 25),

              /// BALANCE CARD
              const BalanceCard(balance: 0),

              const SizedBox(height: 20),

              /// BUTTONS (Row)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: PrimaryBtn(
                      text: "Withdraw",
                      onTap: () {
                         Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) => const WithdrawScreen(),
                            ),
                          ); 
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PrimaryBtn(
                      text: "Add money",
                      onTap: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 20),

              /// TRANSACTION FILTER BUTTONS
              Row(
                children: [
                  Expanded(
                    child: PrimaryBtn(
                      text: "Pending",
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: PrimaryBtn(
                      text: "Succesfull",
                      onTap: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}