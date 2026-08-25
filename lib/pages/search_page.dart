import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  // التحكم في الفلاتر (Women, Men, Kids)
  int _selectedFilterIndex = 0;
  final List<String> _filters = ["Women", "Men", "Kids"];

  // التحكم في حالة الأقسام الفرعية
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

  // داتا الأقسام الفرعية (مثال لقسم Clothing)
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
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
                decoration: InputDecoration(
                  hintText: "What are you looking for?",
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon: const Icon(Icons.search, color: Colors.black87),
                  suffixIcon: _searchQuery.isNotEmpty
                      ? IconButton(
                          icon: const Icon(Icons.close, color: Colors.black87),
                          onPressed: () {
                            setState(() {
                              _searchController.clear();
                              _searchQuery = "";
                            });
                          },
                        )
                      : null,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(color: Colors.grey.shade300),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: const BorderSide(color: Colors.black),
                  ),
                ),
              ),
            ),

            Expanded(child: _buildContent()),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_searchQuery.isNotEmpty) {
      // حالة عدم وجود نتائج (الصورة التالتة)
      return _buildNoResultsView();
    } else if (_isSubCategoryView) {
      // حالة الأقسام الفرعية (الصورة التانية)
      return _buildSubCategoriesView();
    } else {
      // الحالة الافتراضية للأقسام الرئيسية (الصورة الأولى)
      return _buildMainCategoriesView();
    }
  }

  // --- Views ---

  // 1. الأقسام الرئيسية
  Widget _buildMainCategoriesView() {
    return Column(
      children: [
        // Filters (Women, Men, Kids)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(_filters.length, (index) {
              bool isSelected = _selectedFilterIndex == index;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedFilterIndex = index;
                  });
                },
                child: Container(
                  width: 100,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(
                      color: isSelected ? Colors.black : Colors.grey.shade400,
                    ),
                  ),
                  child: Text(
                    _filters[index],
                    style: TextStyle(
                      color: isSelected ? Colors.white : Colors.black87,
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

        // Main Categories List
        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _mainCategories.length,
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade200, height: 1),
            itemBuilder: (context, index) {
              final cat = _mainCategories[index];
              return ListTile(
                leading: Icon(cat["icon"], color: Colors.black87),
                title: Text(
                  cat["title"],
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                ),
                onTap: () {
                  // لو داس على Clothing مثلاً، نغير الـ State للأقسام الفرعية
                  if (cat["title"] == "Clothing") {
                    setState(() {
                      _isSubCategoryView = true;
                      _selectedMainCategory = cat["title"];
                    });
                  }
                },
              );
            },
          ),
        ),
      ],
    );
  }

  // 2. الأقسام الفرعية
  Widget _buildSubCategoriesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header (Back button + Title)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
          child: Row(
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () {
                  setState(() {
                    _isSubCategoryView = false;
                  });
                },
              ),
              Text(
                _selectedMainCategory,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),

        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            itemCount: _clothingSubCategories.length,
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey.shade200, height: 1),
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  _clothingSubCategories[index],
                  style: const TextStyle(fontSize: 15, color: Colors.black87),
                ),
                trailing: const Icon(
                  Icons.chevron_right,
                  color: Colors.black54,
                ),
                onTap: () {
                  // تنفيذ الانتقال لصفحة المنتجات
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNoResultsView() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/search .png', height: 240, width: 237),
          const SizedBox(height: 20),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              children: [
                const TextSpan(text: 'No results for "'),
                TextSpan(
                  text: _searchQuery,
                  style: const TextStyle(color: Colors.indigoAccent),
                ),
                const TextSpan(text: '"'),
              ],
            ),
          ),
          const SizedBox(height: 100), //
        ],
      ),
    );
  }
}
