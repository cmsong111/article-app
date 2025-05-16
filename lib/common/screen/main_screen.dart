import 'package:article/article/presentation/screen/article_list_screen.dart';
import 'package:article/common/widget/adaptive_navigation.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final _pages = [const ArticleListScreen(), const ArticleListScreen()];

  @override
  Widget build(BuildContext context) {
    return AdaptiveNavigation(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.article), label: 'Articles'),
        NavigationDestination(icon: Icon(Icons.person), label: 'Profile'),
      ],
      selectedIndex: _selectedIndex,
      onDestinationSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: _pages[_selectedIndex],
    );
  }
}
