

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import '../screens/categories_meals_screen.dart';

class CategoryItem extends StatelessWidget {

final Category category;
const CategoryItem(this.category);

void _selectCategory(BuildContext context){
  Navigator.of(context).push(
    MaterialPageRoute(
      builder: (_) {
        return CategoriesMealsScreen(category);
      },
    ),
  );
}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectCategory(context),
      borderRadius: BorderRadius.circular(6),
      splashColor: Theme.of(context).primaryColor,
          child: Container(
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.5),
              category.color
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
        ),
      ),
    );
  }
}