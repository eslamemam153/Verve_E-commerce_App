import 'package:flutter/material.dart';

class NoSearchResultsWidget extends StatelessWidget {
  final String searchQuery;

  const NoSearchResultsWidget({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/search .png', height: 240, width: 237),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 18,
                color: colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: 'No results for "'),
                TextSpan(
                  text: searchQuery,
                  style: TextStyle(color: colorScheme.primary),
                ),
                const TextSpan(text: '"'),
              ],
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
