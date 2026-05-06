import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Core/utils/apptextstyle.dart';
import 'package:snappis/Presentation/Widgets/Admin/App_text_field.dart';
import 'package:snappis/Presentation/Widgets/Admin/app_card.dart';
import 'package:snappis/Presentation/Widgets/Admin/savebutton.dart';
import 'package:snappis/Presentation/Widgets/Admin/send_text_smsbtn.dart';

class Emailsetting extends StatefulWidget {
  const Emailsetting({super.key});

  @override
  State<Emailsetting> createState() => _EmailsettingState();
}

class _EmailsettingState extends State<Emailsetting> {
 
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Email Settings", style: AppTextStyles.title),
                    SizedBox(height: 4),
                    Text(
                      "Configure email server settings for system notifications and communications",
                      style: AppTextStyles.subtitle,
                    ),
                  ],
                ),
                const SaveButton(),
              ],
            ),

            const SizedBox(height: 24),

            /// Body
            Expanded(
              child: Row(
                children: [
                  /// Left Form
                  Expanded(
                    flex: 3,
                    child: AppCard(
                      child: GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 20,
                        crossAxisSpacing: 20,
                        childAspectRatio: 3.5,
                        children: const [
                          AppTextField(
                            label: "Email Provider",
                            hint: "SMTP",
                            icon: Icons.mail,
                          ),
                          AppTextField(
                            label: "Mail Driver",
                            hint: "smtp",
                            icon: Icons.storage,
                          ),
                          AppTextField(
                            label: "SMTP Host",
                            hint: "smtp.example.com",
                            icon: Icons.storage,
                          ),
                          AppTextField(
                            label: "SMTP Port",
                            hint: "587",
                            icon: Icons.info_outline,
                          ),
                          AppTextField(
                            label: "SMTP Username",
                            hint: "user@example.com",
                            icon: Icons.person,
                          ),
                          AppTextField(
                            label: "SMTP Password",
                            hint: "********",
                            icon: Icons.lock,
                            obscure: true,
                            suffix: Icon(Icons.visibility),
                          ),
                          AppTextField(
                            label: "Mail Encryption",
                            hint: "TLS",
                            icon: Icons.lock_outline,
                          ),
                          AppTextField(
                            label: "From Address",
                            hint: "noreply@example.com",
                            icon: Icons.mail_outline,
                          ),
                          AppTextField(
                            label: "From Name",
                            hint: "WorkDo System",
                            icon: Icons.person_outline,
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(width: 24),

                  /// Right Test Card
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
                                "Test Email Configuration",
                                style: AppTextStyles.label,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          AppTextField(
                            label: "Send Test To",
                            hint: "test@example.com",
                            icon: Icons.mail,
                          ),
                          SizedBox(height: 12),
                          Text(
                            "Enter an email address to send a test message",
                            style: AppTextStyles.subtitle,
                          ),
                          Spacer(),
                          SendTestButton(),
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