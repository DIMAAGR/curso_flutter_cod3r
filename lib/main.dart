import 'package:flutter/material.dart';
import 'package:meals/screens/meal_detail_screen.dart';
import 'package:meals/screens/tabs_screen.dart';
import 'package:meals/utils/app_routes.dart';
import 'screens/categories_meals_screen.dart';
import 'package:meals/screens/settings_screen.dart';
import 'models/meal.dart';
import 'data/dummy_data.dart';
import 'package:meals/models/filters.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  Filters filters = Filters();
  List<Meal> _availableMeals = DUMMY_MEALS;

  void _filterMeals(Filters settings){
    setState(() {
      filters = settings;
      _availableMeals = DUMMY_MEALS.where((meal) {
        final filterGluten = settings.isGlutenFree && !meal.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !meal.isLactoseFree;
        final filterVegan = settings.isVegan && !meal.isVegan;
        final filterVegetarian = settings.isVegetarian && !meal.isVegetarian;
        return !filterGluten && !filterLactose && !filterVegan && !filterVegetarian;

      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vamos Cozinhar',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
          title: TextStyle(
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
          )
        )
      ),
      routes: {
        AppRoutes.HOME : (ctx) => TabScreen(),
        AppRoutes.CATEGORIES_MEALS : (ctx) => CategoriesMealsScreen(_availableMeals),
        AppRoutes.MEAL_DETAIL: (ctx) => MealDetailScreen(),
        AppRoutes.SETTINGS: (ctx) => SettingsScreen(filters, _filterMeals),
      },
    );
  }
}