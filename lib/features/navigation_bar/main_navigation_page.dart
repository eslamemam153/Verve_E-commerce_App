import 'package:flutter/material.dart';
import 'package:flutter_session_1/features/cart/cart_page.dart';
import 'package:flutter_session_1/features/favorites/favorites_page.dart';
import 'package:flutter_session_1/features/home/home_page.dart';
import 'package:flutter_session_1/features/profile/profile_page.dart';
import 'package:flutter_session_1/features/search/search_page.dart';


class MainNavigationBar extends StatefulWidget {
  const MainNavigationBar({super.key});

  @override
  State<MainNavigationBar> createState() => _MainNavigationBarState();
}

class _MainNavigationBarState extends State<MainNavigationBar> {
  int _currentIndex = 0;

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const HomePage();
      case 1:
        return const SearchPage();
      case 2:
        return FavoritesPage(
          onExplorePressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      case 3:
        return CartPage(
          onInspirePressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      case 4:
        return ProfilePage(
          onBackPressed: () {
            setState(() {
              _currentIndex = 0;
            });
          },
        );
      default:
        return const HomePage();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return PopScope(
      canPop: _currentIndex == 0,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        setState(() {
          _currentIndex = 0;
        });
      },
      child: Scaffold(
        body: _getPage(_currentIndex),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          type: BottomNavigationBarType.fixed,
          backgroundColor: colorScheme.surface,
          selectedItemColor: colorScheme.primary,
          unselectedItemColor: colorScheme.onSurface.withOpacity(0.5),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
            ),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border),
              label: "Favorite",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: "Cart",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline),
              label: "Profile",
            ),
          ],
        ),
      ),
    );
  }
}
