import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Core/utils/apptextstyle.dart';
import 'package:snappis/Presentation/Widgets/Admin/App_text_field.dart';
import 'package:snappis/Presentation/Widgets/Admin/app_card.dart';
import 'package:snappis/Presentation/Widgets/Admin/savebutton.dart';
import 'package:snappis/Presentation/Widgets/Admin/sendtestbtn.dart';
import 'package:snappis/Presentation/Widgets/Admin/toggletitle.dart';

class Smssetting extends StatefulWidget {
  const Smssetting({super.key});

  @override
  State<Smssetting> createState() => _SmssettingState();
}

class _SmssettingState extends State<Smssetting> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Header
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text("Twilio SMS Settings", style: AppTextStyles.title),
                      SizedBox(height: 4),
                      Text(
                        "Configure Twilio settings for SMS notifications and communications",
                        style: AppTextStyles.subtitle,
                      ),
                    ],
                  ),
                ),
                const SaveButton(),
              ],
            ),

            const SizedBox(height: 24),

            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// LEFT SIDE
                  Expanded(
                    flex: 3,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          AppCard(
                            child: Column(
                              children: [
                                Row(
                                  children: const [
                                    Expanded(
                                      child: AppTextField(
                                        label: "Account SID",
                                        hint: "ACxxxxxxxxxxxxxxxxxxxxxxxx",
                                        icon: Icons.vpn_key,
                                      ),
                                    ),
                                    SizedBox(width: 20),
                                    Expanded(
                                      child: AppTextField(
                                        label: "Auth Token",
                                        hint: "••••••••••••••••••",
                                        icon: Icons.lock,
                                        obscure: true,
                                        suffix: Icon(Icons.visibility),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                const AppTextField(
                                  label: "From Phone Number",
                                  hint: "+1234567890",
                                  icon: Icons.phone,
                                ),
                      
                                /// Instructions Box
                                const SizedBox(height: 20),
                                Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: AppColors.infoBg,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                        color: AppColors.infoBorder),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: const [
                                      Row(
                                        children: [
                                          Icon(Icons.chat_bubble_outline,
                                              color: Colors.blue),
                                          SizedBox(width: 8),
                                          Text(
                                            "Twilio Setup Instructions",
                                            style: AppTextStyles.label,
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 12),
                                      Text("1. Sign up for a Twilio account at twilio.com"),
                                      Text("2. Get your Account SID and Auth Token from the Twilio Console"),
                                      Text("3. Purchase a phone number or use a trial number"),
                                      Text("4. Enter your credentials and admin phone number"),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                      
                          const SizedBox(height: 24),
                      
                          /// SMS Notification Settings
                          AppCard(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Icon(Icons.notifications,
                                        color: AppColors.green),
                                    SizedBox(width: 8),
                                    Text(
                                      "SMS Notification Settings",
                                      style: AppTextStyles.label,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                GridView.count(
                                  shrinkWrap: true,
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: 2.8,
                                  children: const [
                                    ToggleTile(title: "New Case"),
                                    ToggleTile(title: "New Client"),
                                    ToggleTile(title: "New Hearing"),
                                    ToggleTile(title: "New Invoice"),
                                    ToggleTile(title: "Invoice Sent"),
                                    ToggleTile(title: "New Court"),
                                    ToggleTile(title: "New Judge"),
                                    ToggleTile(title: "New Regulatory Body"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  /// RIGHT SIDE TEST CARD
                  Expanded(
                    flex: 1,
                    child: AppCard(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Row(
                            children: [
                              Icon(Icons.send, color: AppColors.green),
                              SizedBox(width: 8),
                              Text(
                                "Test SMS Configuration",
                                style: AppTextStyles.label,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          AppTextField(
                            label: "Send Test To",
                            hint: "+1234567890",
                            icon: Icons.phone,
                          ),
                          SizedBox(height: 8),
                          Text(
                            "Enter a phone number with country code e.g., +1234567890",
                            style: AppTextStyles.subtitle,
                          ),
                          Spacer(),
                          SendTestSmsButton(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}