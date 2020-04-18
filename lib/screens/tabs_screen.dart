import 'package:flutter/material.dart';
import 'package:meals/screens/categories_screen.dart';
import 'package:meals/screens/favorite_screen.dart';
import 'package:meals/components/main_drawer.dart';
import 'package:meals/models/meal.dart';

class TabScreen extends StatefulWidget {
  final List<Meal> favoriteMeals;

  const TabScreen(this.favoriteMeals);
  
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedScreenIndex = 0;
  List<Map<String, Object>> _screens;

  @override
  void initState(){
    super.initState();
    _screens = [
    {'Title': 'Lista de Categorias', 'Screen' : CategoriesScreen()},
    {'Title': 'Lista de Favoritos', 'Screen': FavoriteScreen(widget.favoriteMeals)},
  ];
  }

  _selectScreen(int index){
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_screens[_selectedScreenIndex]['Title']),
      ),
      drawer: MainDrawer(),
      body: _screens[_selectedScreenIndex]['Screen'],
        bottomNavigationBar: BottomNavigationBar(
          onTap: _selectScreen,
          backgroundColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.white,
          selectedItemColor: Theme.of(context).accentColor,
          currentIndex: _selectedScreenIndex,
          items: [
            BottomNavigationBarItem(
          icon: Icon(Icons.category),
          title: Text('Categorias')
        ),
         BottomNavigationBarItem(
          icon: Icon(Icons.favorite),
          title: Text('Favoritos')
        ),
          ],
          ),
    );
  }
}