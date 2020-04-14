import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Complexity {
  Simple,
  Medium,
  Hard
}

enum Cost{
  Cheap,
  Fair,
  Expensive
}

class Meal {
  final String id;
  final List<String> categories;
  final String title;
  final String imageUrl;
  final List<String> ingredients;
  final List<String> steps;
  final int duration;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final Complexity complexity;
  final Cost cost;

  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
    @required this.complexity,
    @required this.cost,
  });

  String get complexityText {
    switch(complexity) {
      case Complexity.Simple:
        return 'Fácil';
      case Complexity.Medium:
        return 'Médio';
      case Complexity.Hard:
        return 'Difícil';
      default:
        return '';
    }
  }

    Widget get costWidget {
    switch(cost) {
      case Cost.Cheap:
        return Row(children: <Widget>[
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
               ],);
      case Cost.Fair:
        return  Row(children: <Widget>[
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                
               ],);
      case Cost.Expensive:
        return Row(children: <Widget>[
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
                Icon(Icons.attach_money),
               ],);
      default:
        return Row(children: <Widget>[
                Icon(Icons.attach_money)
               ],);
     }
  }
}