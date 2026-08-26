import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/profile/components/profile_info_tile.dart';
import 'package:flutter_session_1/features/profile/components/profile_leading.dart';


class ProfilePage extends StatelessWidget {
  final VoidCallback? onBackPressed;

  const ProfilePage({super.key, this.onBackPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ProfileLeadingWidget(onBackPressed: onBackPressed),
          const SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProfileInfoTileWidget(
                    icon: Icons.email_outlined,
                    title: "Email",
                    subtitle: "eslamvip892@gamil.com",
                    onTap: () {},
                  ),
                  ProfileInfoTileWidget(
                    icon: Icons.mobile_screen_share_outlined,
                    title: "Mobile",
                    subtitle: "01236596897",
                    onTap: () {},
                  ),
                  ProfileInfoTileWidget(
                    icon: Icons.facebook,
                    title: "Facebook",
                    subtitle: "Eslam Emam",
                    onTap: () {},
                  ),
                  ProfileInfoTileWidget(
                    icon: Icons.hub_outlined,
                    title: "GitHub",
                    subtitle: "eslamemam153",
                    onTap: () {},
                  ),
                  ProfileInfoTileWidget(
                    icon: Icons.link_rounded,
                    title: "Linked-in",
                    subtitle: "in/eslam-emam153",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
