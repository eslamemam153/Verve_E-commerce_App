import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/search/components/no_search_results_widget.dart';
import 'package:flutter_session_1/features/search/components/search_input_widget.dart';
import 'package:flutter_session_1/features/search/components/search_main_categories_widget.dart';
import 'package:flutter_session_1/features/search/components/search_sub_categories_widget.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  int _selectedFilterIndex = 0;
  final List<String> _filters = ["Women", "Men", "Kids"];

  bool _isSubCategoryView = false;
  String _selectedMainCategory = "";

  final List<Map<String, dynamic>> _mainCategories = [
    {"title": "New Arrivals", "icon": Icons.local_shipping_outlined},
    {"title": "Hot Drops", "icon": Icons.local_fire_department_outlined},
    {"title": "Sales", "icon": Icons.percent_outlined},
    {"title": "Clothing", "icon": Icons.checkroom_outlined},
    {"title": "Accessoiries", "icon": Icons.watch_outlined},
    {"title": "Designer", "icon": Icons.diamond_outlined},
    {"title": "Brands", "icon": Icons.sell_outlined},
    {"title": "Beauty", "icon": Icons.face_retouching_natural_outlined},
    {"title": "Lifestyle", "icon": Icons.chair_outlined},
    {"title": "Launches", "icon": Icons.rocket_launch_outlined},
  ];

  final List<String> _clothingSubCategories = [
    "All clothing",
    "T-shirts",
    "Sweatshirts",
    "Jeans",
    "Pants",
    "Shorts",
    "Jackets",
    "Loungewear",
    "Launches",
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: SafeArea(
        child: Column(
          children: [
            SearchInputWidget(
              controller: _searchController,
              searchQuery: _searchQuery,
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
              onClear: () {
                setState(() {
                  _searchController.clear();
                  _searchQuery = "";
                });
              },
            ),
            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_searchQuery.isNotEmpty) {
      return NoSearchResultsWidget(searchQuery: _searchQuery);
    } else if (_isSubCategoryView) {
      return SearchSubCategoriesWidget(
        categoryName: _selectedMainCategory,
        subCategories: _clothingSubCategories,
        onBack: () {
          setState(() {
            _isSubCategoryView = false;
          });
        },
      );
    } else {
      return SearchMainCategoriesWidget(
        filters: _filters,
        selectedFilterIndex: _selectedFilterIndex,
        onFilterSelected: (index) {
          setState(() {
            _selectedFilterIndex = index;
          });
        },
        categories: _mainCategories,
        onCategorySelected: (title) {
          if (title == "Clothing") {
            setState(() {
              _isSubCategoryView = true;
              _selectedMainCategory = title;
            });
          }
        },
      );
    }
  }
}
