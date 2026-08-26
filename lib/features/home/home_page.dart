import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/components/home_app_bar.dart';
import 'package:flutter_session_1/features/home/components/home_banner.dart';
import 'package:flutter_session_1/features/home/components/home_categories_section.dart';
import 'package:flutter_session_1/features/home/components/home_drawer.dart';
import 'package:flutter_session_1/features/home/components/home_foryou_section.dart';
import 'package:flutter_session_1/features/home/components/home_header_section.dart';
import 'package:flutter_session_1/features/home/components/home_horizontal_productlist.dart';
import 'package:flutter_session_1/features/home/components/home_inspirational_section.dart';
import 'package:flutter_session_1/features/home/components/home_jackets_section.dart';
import 'package:flutter_session_1/features/home/components/home_outdoor_section.dart';
import 'package:flutter_session_1/features/home/components/home_promo_banner.dart';
import 'package:flutter_session_1/features/home/components/home_sports_section.dart';
import 'package:flutter_session_1/features/home/components/home_winter_banner.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      drawer: HomeDrawer(),
      appBar: HomeAppBar(colorScheme: colorScheme),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoriesSection(),
            SizedBox(height: 20),
            HomeBanner(),
            SizedBox(height: 20),
            HeaderSection(title: "Best Sellers"),
            HorizontalProductList(),
            SizedBox(height: 20),
            HomeWinterBanner(),
            SizedBox(height: 20),
            SportsSectionWidget(),
            SizedBox(height: 20),
            HorizontalProductList(),
            SizedBox(height: 20),
            InspirationalSectionWidget(),
            SizedBox(height: 20),
            JacketsSectionWidget(),
            SizedBox(height: 20),
            OutdoorsSectionWidget(),
            SizedBox(height: 20),
            ForYouSectionWidget(),
            PromoBannerWidget(),
          ],
        ),
      ),
    );
  }
}
