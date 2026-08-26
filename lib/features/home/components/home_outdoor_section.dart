import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/home/components/home_horizontal_productlist.dart';


class OutdoorsSectionWidget extends StatelessWidget {
  final int startIndex;
  final int maxItems;
  final String bannerImage;

  const OutdoorsSectionWidget({
    super.key,
    this.startIndex = 6,
    this.maxItems = 6,
    this.bannerImage = 'assets/images/outdoor_banner.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          color: const Color(0xFF1E391F),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Outdoors",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 4),
              const Text(
                "Gear up for your next adventure",
                style: TextStyle(fontSize: 14, color: Colors.white70),
              ),
              const SizedBox(height: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(4),
                child: Image.asset(
                  bannerImage,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          color: const Color.fromARGB(255, 3, 69, 3),
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: HorizontalProductList(
            startIndex: startIndex,
            maxItems: maxItems,
          ),
        ),
      ],
    );
  }
}
