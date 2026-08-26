import 'package:flutter/material.dart';

class SearchSubCategoriesWidget extends StatelessWidget {
  final String categoryName;
  final List<String> subCategories;
  final VoidCallback onBack;

  const SearchSubCategoriesWidget({
    super.key,
    required this.categoryName,
    required this.subCategories,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
                onPressed: onBack,
              ),
              Text(
                categoryName,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: subCategories.length,
            separatorBuilder: (context, index) =>
                Divider(color: colorScheme.outlineVariant, height: 1),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  subCategories[index],
                  style: TextStyle(fontSize: 15, color: colorScheme.onSurface),
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: colorScheme.onSurfaceVariant,
                ),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}
