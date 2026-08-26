import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/settings/components/settings_tile_widget.dart';
import 'package:flutter_session_1/features/settings/components/settings_title_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Settings",
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: colorScheme.onSurface,
          ),
        ),
        centerTitle: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            SectionTitleWidget(title: "GENERAL"),
            SettingsTileWidget(icon: Icons.person, title: "Account"),
            SettingsTileWidget(
              icon: Icons.notifications_active_outlined,
              title: "Notification",
            ),
            SettingsTileWidget(
              icon: Icons.card_giftcard_outlined,
              title: "Coupons",
            ),
            SettingsTileWidget(icon: Icons.logout_outlined, title: "Logout"),
            SettingsTileWidget(
              icon: Icons.delete_outlined,
              title: "Delete account",
              isDestructive: true,
            ),

            SizedBox(height: 20),

            SectionTitleWidget(title: "FEEDBACK"),
            SettingsTileWidget(
              icon: Icons.warning_amber_rounded,
              title: "Report a bug",
            ),
            SettingsTileWidget(
              icon: Icons.send_outlined,
              title: "Send feedback",
              showDivider: false,
            ),

            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
