import 'package:flutter/material.dart';

class FavoritesFiltersWidget extends StatelessWidget {
  const FavoritesFiltersWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final filters = ["Deals", "Brand", "Size", "Color"];

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          OutlinedButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.filter_alt_outlined,
              size: 18,
              color: colorScheme.onSurface,
            ),
            label: Text(
              "Filter",
              style: TextStyle(color: colorScheme.onSurface),
            ),
          ),
          const SizedBox(width: 10),
          ...filters.map((filter) {
            return Padding(
              padding: const EdgeInsets.only(right: 10),
              child: OutlinedButton(
                onPressed: () {},
                child: Text(
                  filter,
                  style: TextStyle(color: colorScheme.onSurface),
                ),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
