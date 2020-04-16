import 'package:flutter/material.dart';
import 'package:meals/models/category.dart';
import 'package:meals/utils/app_routes.dart';

class ChipCategoryItem extends StatefulWidget {

  final Category category;
  
  const ChipCategoryItem(this.category);

  @override
  _ChipCategoryItemState createState() => _ChipCategoryItemState();
}

class _ChipCategoryItemState extends State<ChipCategoryItem> {


 void _selectCategory(BuildContext context){
  Navigator.of(context).pushNamed(
    AppRoutes.CATEGORIES_MEALS,
    arguments: widget.category
    );
 }

  @override
  Widget build(BuildContext context) {
    return  ActionChip(
      label: Text(widget.category.title),
      onPressed: () => _selectCategory(context),
      );
  }
}
