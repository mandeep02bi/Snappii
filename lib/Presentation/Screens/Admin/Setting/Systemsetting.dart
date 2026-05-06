import 'package:flutter/material.dart';
import 'package:snappis/Core/utils/Colors.dart';
import 'package:snappis/Core/utils/apptextstyle.dart' show AppTextStyles;
import 'package:snappis/Presentation/Widgets/Admin/savebutton.dart';
import 'package:snappis/Presentation/Widgets/Admin/settingcardcontainer.dart';
import 'package:snappis/Presentation/Widgets/Admin/settingdropdown.dart';

class Systemsetting extends StatefulWidget {
  const Systemsetting({super.key});

  @override
  State<Systemsetting> createState() => _SystemsettingState();
}

class _SystemsettingState extends State<Systemsetting> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SizedBox(
          width: 900,
          child: SettingsCard(
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
                        Text("System Settings", style: AppTextStyles.title),
                        SizedBox(height: 4),
                        Text(
                          "Configure system-wide settings for your application",
                          style: AppTextStyles.subtitle,
                        ),
                      ],
                    ),
                    const SaveButton(),
                  ],
                ),

                const SizedBox(height: 30),

                /// Grid
                GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  childAspectRatio: 4,
                  children: const [
                    SettingssDropdown(
                      label: "Default Language",
                      value: "English",
                      items: ["English", "Hindi"],
                    ),
                    SettingssDropdown(
                      label: "Date Format",
                      value: "Y-m-d (2025-01-01)",
                      items: ["Y-m-d (2025-01-01)", "d-m-Y"],
                    ),
                    SettingssDropdown(
                      label: "Time Format",
                      value: "H:i (13:30)",
                      items: ["H:i (13:30)", "h:i A (01:30 PM)"],
                    ),
                    SettingssDropdown(
                      label: "Calendar Start Day",
                      value: "Sunday",
                      items: ["Sunday", "Monday"],
                    ),
                  ],
                ),

                const SizedBox(height: 20),

                SettingssDropdown(
                  label: "Default Timezone",
                  value: "(GMT+5:30) Asia/Calcutta (India Standard Time)",
                  items: [
                    "(GMT+5:30) Asia/Calcutta (India Standard Time)",
                    "(GMT+0:00) UTC",
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}