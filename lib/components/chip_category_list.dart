import 'package:flutter/material.dart';
import 'package:meals/components/chip_category_item.dart';
import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category.dart';

class ChipCategoryList extends StatefulWidget {
  final List<String> categories;
  ChipCategoryList(this.categories);

  @override
  _ChipCategoryListState createState() => _ChipCategoryListState();
}


class _ChipCategoryListState extends State<ChipCategoryList> {

  final List<Category> thisscategory = DUMMY_CATEGORIES;

Category  _seachCategories(int index){
   for(Category id in thisscategory){
     if( id.id == widget.categories[index]){
       return id;
     }
   }
}
  
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(widget.categories.length, (int index){
       return ChipCategoryItem(_seachCategories(index));
      }),
    );
  }
}