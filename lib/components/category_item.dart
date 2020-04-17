import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class CategoryItem extends StatelessWidget {

final Category category;
const CategoryItem(this.category);


 void _selectCategory(BuildContext context){
  Navigator.of(context).pushNamed(
    AppRoutes.CATEGORIES_MEALS,
    arguments: category
    );
}



  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: () => _selectCategory(context),
        borderRadius: BorderRadius.circular(15),
        splashColor: Theme.of(context).primaryColor,
            child: Container(
          child: Text(
            category.title,
            style: Theme.of(context).textTheme.title,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
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
      ),
    );
  }
}