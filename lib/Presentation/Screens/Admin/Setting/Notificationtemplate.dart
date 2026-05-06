import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Core/utils/apptextstyle.dart';
import 'package:snappis/Presentation/Widgets/Admin/app_card.dart';
import 'package:snappis/Presentation/Widgets/Admin/channel_toggle.dart' show ChannelToggle;
import 'package:snappis/Presentation/Widgets/Admin/template_row.dart';
import 'package:snappis/Presentation/Widgets/Search_field.dart';

class Notificationtemplate extends StatefulWidget {
  const Notificationtemplate({super.key});

  @override
  State<Notificationtemplate> createState() => _NotificationtemplateState();
}

class _NotificationtemplateState extends State<Notificationtemplate> {
  
  @override
  Widget build(BuildContext context) {
    final templates = [
      "Team Member Created",
      "New Judge",
      "New License",
      "New Regulatory Body",
      "New CLE Record",
      "New Case",
      "New Client",
      "New Task",
      "New Hearing",
      "New Invoice",
    ];

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Notification Templates", style: AppTextStyles.title),
            const SizedBox(height: 20),

            /// Filters
            AppCard(
              child: Row(
                children: [
                  
                  const SearchField(),
                  const SizedBox(width: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.green,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text("Search"),
                  ),
                  const Spacer(),
                  const ChannelToggle(),
                  const SizedBox(width: 16),
                  Row(
                    children: const [
                      Text("Per Page: "),
                      SizedBox(width: 6),
                      Text("10"),
                      Icon(Icons.keyboard_arrow_down),
                    ],
                  )
                ],
              ),
            ),

            const SizedBox(height: 16),

            /// Table
            Expanded(
              child: AppCard(
                child: Column(
                  children: [
                    /// Header
                    Row(
                      children: const [
                        Expanded(
                          child: Text("Name",
                              style: AppTextStyles.header),
                        ),
                        Text("Actions",
                            style: AppTextStyles.header),
                      ],
                    ),
                    const SizedBox(height: 8),
                    const Divider(),

                    /// Rows
                    Expanded(
                      child: ListView(
                        children: templates
                            .map((e) => TemplateRow(name: e))
                            .toList(),
                      ),
                    ),
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