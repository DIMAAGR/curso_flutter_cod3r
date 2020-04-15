import 'package:flutter/material.dart';
import 'package:meals/utils/app_routes.dart';
import '../models/meal.dart';
class MealItem extends StatelessWidget {

  final Meal meal;

  const MealItem(this.meal);

  void _selectMeal(BuildContext context){
    Navigator.of(context).pushNamed(
      AppRoutes.MEAL_DETAIL,
      arguments: meal,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(15)
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: InkWell(
          onTap:() => _selectMeal(context),
                  child: Column(
            children: <Widget>[
              Row(
              children: <Widget>[
                Container(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                padding: const EdgeInsets.all(3.5),
              child: ClipRRect(
                borderRadius:BorderRadius.all(Radius.circular(15)),
                child: Image.network(
                  meal.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              ), 
            ),
          ),
             Column(
       children: <Widget>[
           Container(
             width: 220,
             alignment: Alignment.topLeft,
             child: Text(
               meal.title,
               style: TextStyle(
                 fontSize: 20
               ),
               softWrap: true,
               ),
           ),
           SizedBox(height: 5,),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,  
             children: <Widget>[
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(18)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(2.5),
                   child: Row(children: <Widget>[
                    Icon(Icons.schedule),
                    SizedBox(width: 6,),
                    Text('${meal.duration} min'),
                   ],),
                 ),
               ),
                 Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(18)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(2.5),
                   child: meal.costWidget,
                 ),
               ),
               Card(
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.all(Radius.circular(18)),
                 ),
                 child: Padding(
                   padding: const EdgeInsets.all(5),
                   child: Row(children: <Widget>[
                    Text('${meal.complexityText}'),
                   ],),
                 ),
               ),
             ],
           )
       ],
             ),
             ],
            ),
    ],
          ),
        ),
        
      );
  }
}

// meal.costWidget