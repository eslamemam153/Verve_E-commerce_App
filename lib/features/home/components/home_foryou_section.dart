import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/components/home_header_section.dart';
import 'package:flutter_session_1/features/home/components/home_horizontal_productlist.dart';

class ForYouSectionWidget extends StatelessWidget {
  final VoidCallback? onSeeAllPressed;
  final int startIndex;
  final int maxItems;

  const ForYouSectionWidget({
    super.key,
    this.onSeeAllPressed,
    this.startIndex = 0,
    this.maxItems = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderSection(title: "For you", onSeeAllPressed: onSeeAllPressed),
          const SizedBox(height: 16),
          HorizontalProductList(startIndex: startIndex, maxItems: maxItems),
        ],
      ),
    );
  }
}
