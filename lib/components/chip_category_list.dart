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
Category thisCategory;
String finalString = '';

Category  _seachCategories(){
 for(String c in widget.categories){
   for(Category id in thisscategory){
     if(c == id.id && c != finalString){
       finalString = c;
       return id;
     }else{

     }
   }
 }
}

  

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 6.0,
      runSpacing: 6.0,
      children: List<Widget>.generate(widget.categories.length, (int index){
       return ChipCategoryItem(_seachCategories());
      }),
    );
  }
}