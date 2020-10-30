import 'package:flutter/material.dart';

// Widges
import '../components/main_drawer.dart';

// Pages
import 'categories_screen.dart';
import 'favorite_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0;
  final List<Map<String, Object>> _screen = [
    {
      'title': 'DeliMeals',
      'screen': CategoriesScreen(),
    },
    {
      'title': 'Favoritos',
      'screen': FavoriteScreen(),
    },
  ];

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screen[_selectedScreenIndex]['title']),
      ),
      drawer: Drawer(
        child: MainDrawer(),
      ),
      body: _screen[_selectedScreenIndex]['screen'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedScreenIndex,
        // alternativa de animacao de das tabs
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
            // remover caso n utilize shifting
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            // remover caso n utilize shifting
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favoritos',
          ),
        ],
      ),
    );
  }
}
