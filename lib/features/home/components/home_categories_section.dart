// import 'package:flutter/material.dart';

// class CategoriesSection extends StatefulWidget {
//   const CategoriesSection({super.key});

//   @override
//   State<CategoriesSection> createState() => _CategoriesSectionState();
// }

// class _CategoriesSectionState extends State<CategoriesSection> {
//   final List<String> categories = ["All", "Men", "Women", "Kids", "Bags"];
//   String selectedCategory = "All";

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       padding: const EdgeInsets.symmetric(horizontal: 20),
//       child: Row(
//         children: categories.map((cat) {
//           bool isSelected = cat == selectedCategory;

//           return Container(
//             margin: const EdgeInsets.only(right: 10),
//             child: ChoiceChip(
//               label: Text(cat),
//               selected: isSelected,
//               showCheckmark: false,
//               selectedColor: Colors.black,
//               backgroundColor: Colors.white,
//               labelStyle: TextStyle(
//                 color: isSelected ? Colors.white : Colors.black,
//                 fontWeight: FontWeight.w600,
//               ),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(20),
//                 side: BorderSide(
//                   color: isSelected ? Colors.black : Colors.grey.shade300,
//                 ),
//               ),
//               onSelected: (value) {
//                 setState(() {
//                   selectedCategory = cat;
//                 });
//               },
//             ),
//           );
//         }).toList(),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  final List<String> categories = ["All", "Men", "Women", "Kids", "Bags"];
  String selectedCategory = "All";

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: categories.map((cat) {
          bool isSelected = cat == selectedCategory;

          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(cat),
              selected: isSelected,
              showCheckmark: false,
              selectedColor: colorScheme.primary,
              backgroundColor: colorScheme.surface,
              labelStyle: TextStyle(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
                fontWeight: FontWeight.w600,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                side: BorderSide(
                  color: isSelected
                      ? colorScheme.primary
                      : colorScheme.outlineVariant,
                ),
              ),
              onSelected: (value) {
                setState(() {
                  selectedCategory = cat;
                });
              },
            ),
          );
        }).toList(),
      ),
    );
  }
}
