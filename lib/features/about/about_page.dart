import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/about/components/about_app_version_info.dart';
import 'package:flutter_session_1/features/about/components/about_list_item.dart';



class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: colorScheme.onSurface,
            size: 20,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "About",
          style: TextStyle(
            color: colorScheme.onSurface,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            AppVersionInfoWidget(),
            SizedBox(height: 30),

            ItemBuilder(items: ["View changelog"]),
            SizedBox(height: 20),

            ItemBuilder(
              items: [
                "Visit Verve.com",
                "Visit for inspiration",
                "We are hiring!",
              ],
            ),
            SizedBox(height: 30),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Legal",
                style: TextStyle(
                  fontSize: 15,
                  color: colorScheme.onSurfaceVariant,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 10),

            ItemBuilder(
              items: [
                "Acknowledgments",
                "Privacy Policy",
                "Security Policy",
                "Terms of Service",
              ],
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
