import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/components/home_drawer_header_widget.dart';
import 'package:flutter_session_1/features/home/components/home_drawer_tile_widget.dart';


class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(
        children: [
          const DrawerHeaderWidget(),
          const DrawerTileWidget(
            title: "About Page",
            icon: Icons.info_rounded,
            routeName: "/about",
          ),
          const DrawerTileWidget(
            title: "Setting Page",
            icon: Icons.settings,
            routeName: "/settings",
          ),
        ],
      ),
    );
  }
}
