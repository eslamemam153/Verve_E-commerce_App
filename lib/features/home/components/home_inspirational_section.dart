import 'package:flutter/material.dart';

class InspirationalSectionWidget extends StatelessWidget {
  final VoidCallback? onSeeAllPressed;

  const InspirationalSectionWidget({super.key, this.onSeeAllPressed});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    final List<String> dummyImages = [
      'assets/images/inspire_1.jpg',
      'assets/images/inspire_2.jpg',
      'assets/images/inspire_3.jpg',
      'assets/images/inspire_4.jpg',
    ];

    return Container(
      color: colorScheme.primary,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 4,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.65,
            ),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  color: colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.circular(4),
                  image: DecorationImage(
                    image: AssetImage(dummyImages[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),

          const SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "Inspirational",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onPrimary,
                ),
              ),
              InkWell(
                onTap: onSeeAllPressed,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Text(
                    "See all",
                    style: TextStyle(
                      fontSize: 14,
                      color: colorScheme.onPrimary.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
