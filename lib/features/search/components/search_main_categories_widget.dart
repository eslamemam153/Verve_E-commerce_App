import 'package:flutter/material.dart';

class SearchMainCategoriesWidget extends StatelessWidget {
  final List<String> filters;
  final int selectedFilterIndex;
  final ValueChanged<int> onFilterSelected;
  final List<Map<String, dynamic>> categories;
  final ValueChanged<String> onCategorySelected;

  const SearchMainCategoriesWidget({
    super.key,
    required this.filters,
    required this.selectedFilterIndex,
    required this.onFilterSelected,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(filters.length, (index) {
              bool isSelected = selectedFilterIndex == index;
              return GestureDetector(
                onTap: () => onFilterSelected(index),
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? colorScheme.onSurface
                        : colorScheme.surface,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected
                          ? colorScheme.onSurface
                          : colorScheme.outlineVariant,
                    ),
                  ),
                  child: Text(
                    filters[index],
                    style: TextStyle(
                      color: isSelected
                          ? colorScheme.surface
                          : colorScheme.onSurface,
                      fontWeight: isSelected
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: categories.length,
            separatorBuilder: (context, index) =>
                Divider(color: colorScheme.outlineVariant, height: 1),
            itemBuilder: (context, index) {
              final cat = categories[index];
              return ListTile(
                leading: Icon(cat["icon"], color: colorScheme.onSurface),
                title: Text(
                  cat["title"],
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                    color: colorScheme.onSurface,
                  ),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurfaceVariant,
                ),
                onTap: () => onCategorySelected(cat["title"]),
              );
            },
          ),
        ),
      ],
    );
  }
}
