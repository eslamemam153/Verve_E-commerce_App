import 'package:flutter/material.dart';

class HomeCategorySection extends StatelessWidget {
  const HomeCategorySection({super.key});
  final bool isSelected = false;
  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      selected: false,
      onSelected: (value) {},
      showCheckmark: false,
      selectedColor: Colors.black,

      label: Text("Deal"),
      backgroundColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.circular(20),
        side: BorderSide(color: Colors.black, width: 1.5),
      ),
    );
  }
}
