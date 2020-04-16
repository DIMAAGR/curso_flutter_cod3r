import 'package:flutter/material.dart';
import 'package:meals/components/chip_category_list.dart';
import '../models/meal.dart';


class MealDetailScreen extends StatelessWidget {

  Widget _createSectionTitle(BuildContext context, String title){
     return Container(
       alignment: Alignment.centerRight,
       padding: const EdgeInsets.only(
        right: 10 
       ),
        margin: EdgeInsets.symmetric(vertical: 12),
          child: Text(
           title,
           style: Theme.of(context).textTheme.title,
        ),
    );
  }
 
  @override
  Widget build(BuildContext context) {
    final meal = ModalRoute.of(context).settings.arguments as Meal;
     print(meal.categories);


    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
        SliverAppBar(
          expandedHeight: 246 ,
          floating: true,
          pinned: true,
          shape: RoundedRectangleBorder(
             borderRadius:  BorderRadius.only(
               bottomLeft:  Radius.circular(30)
          ),
          ),
          backgroundColor: Colors.pink,
          elevation: 0.0,
          flexibleSpace: FlexibleSpaceBar(
            background: ClipRRect(
                borderRadius:BorderRadius.only(
               bottomLeft:  Radius.circular(30)
          ),
                child: Image.network(
                  meal.imageUrl,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover, 
              ),
            ),
          ),
        ),
        SliverFillRemaining(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(height: 12,),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    meal.title,
                    style: TextStyle(
                      fontSize: 30,
                      fontFamily: 'RobotoCondensed',
                      fontWeight: FontWeight.w300
                    ),
                  ),
                ),
                SizedBox(height: 7,),
                Row(children: <Widget>[
                  Row(
               mainAxisAlignment: MainAxisAlignment.center,  
               children: <Widget>[
                 Card(
                   elevation: 0.0,
                   color: Colors.blueGrey.withOpacity(0.06),
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
                   elevation: 0.0,
                   color: Colors.blueGrey.withOpacity(0.06),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(18)),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(2.5),
                     child: meal.costWidget,
                   ),
                 ),
                 Card(
                   elevation: 0.0,
                   color: Colors.blueGrey.withOpacity(0.06),
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(23)),
                   ),
                   child: Padding(
                     padding: const EdgeInsets.all(7),
                     child: Row(children: <Widget>[
                      Text('${meal.complexityText}'),
                     ],),
                   ),
                 ),
               ],
             ),
             Spacer(),
             Padding(
               padding: const EdgeInsets.only(
                 right: 20
               ),
               child: IconButton(
                 iconSize: 26,
                 icon: Icon(Icons.favorite_border),
                 onPressed: () {},
                 ),
             ),
       ],),   
                   ChipCategoryList(meal.categories),
                   Divider(),
                  _createSectionTitle(context, 'Ingredientes'),
                   Container(
                      height: 280,
                      child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: meal.ingredients.length,
                        itemBuilder: (ctx, index){                     
                          return Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Wrap(
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 22
                                      ),
                                      child: Text(meal.ingredients[index],
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20
                                      ),
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(),
                              ],
                            ),
                          );
                        }),  
                    ),
                    SizedBox(width: 20,),
                    Container(
                      height: 540,
                      child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: meal.steps.length,
                      itemBuilder: (ctx, index){
                        return Column(
                          children: <Widget>[
                            ListTile(
                            leading: CircleAvatar(
                              child: Text('$index'),
                              ),
                              title: Text(meal.steps[index]),
                      ),
                      Divider()
                          ],
                        );}
                    ),
                  )
              ],),
          )
          )
      ],),
    );
  }
}