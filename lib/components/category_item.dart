

import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';

class CategoryItem extends StatelessWidget {

final Category category;

const CategoryItem(this.category);

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}