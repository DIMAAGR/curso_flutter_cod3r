import 'package:flutter/material.dart';
import 'package:meals/models/filters.dart';
import 'package:meals/utils/app_routes.dart';

class SettingsScreen extends StatefulWidget {

  final Filters filters;
  final Function(Filters) onSettingsChanged;
  const SettingsScreen(this.filters ,this.onSettingsChanged);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}



class _SettingsScreenState extends State<SettingsScreen> {

  Filters settings;

  @override
  void initState() {
    super.initState();
    settings = widget.filters;
  }


  Widget _listTileSwitch ({
    String title,
    String subtitle,
    bool value,
    bool thvalue = false,
    Function onChanged,
  }){
    return ListTile(
      trailing: value == false ? IconButton(
        icon: Icon(Icons.check_circle_outline),
        onPressed:() {
          onChanged();
        }) :  IconButton(
        icon: Icon(Icons.check_circle), 
        onPressed:() {
          onChanged();
        }),
      title: Text(
        title,
      ),
      subtitle: Text(
        subtitle,
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
     print(settings.isGlutenFree);
    return Scaffold(
      body: SingleChildScrollView(
              child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                top: 45,
                left: 3),
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_left),
                    iconSize: 30,
                    onPressed: () => Navigator.of(context).pushReplacementNamed(AppRoutes.HOME)),
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                            'Configurações',
                            style: TextStyle(
                              fontSize: 28,
                              color: Colors.black87,
                              fontFamily: 'Raleway',
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                   color: Theme.of(context).accentColor,
                ),
                child: Column( children: <Widget>[
                 Padding(
                   padding: const EdgeInsets.only(
                     left: 8,
                     right: 8,
                     top: 8,
                   ),
                   child: Card(
                     color: Theme.of(context).accentColor,
                     elevation:  0.0,
                     child: _listTileSwitch(
                       title: 'Sem Glutén',
                       subtitle: 'Só exibe refeições sem glutén!',
                       value: settings.isGlutenFree,
                       onChanged: () {
                         return setState(() {
                           settings.isGlutenFree == true ?
                           settings.isGlutenFree = false :
                           settings.isGlutenFree = true;  
                           return  widget.onSettingsChanged(settings);
                         }); 
                       },
                    ),
                   ),
                 ),
                 Divider(),
                  Padding(
                   padding: const EdgeInsets.only(
                     left: 8,
                     right: 8,
                     bottom: 8,
                   ),
                   child: Card(
                     color: Theme.of(context).accentColor,
                     elevation:  0.0,
                     child: _listTileSwitch(
                       title: 'Sem Lactose',
                       subtitle: 'Só exibe refeições sem lactose!',
                       value: settings.isLactoseFree,
                       onChanged: () {
                         return setState(() {
                           settings.isLactoseFree == true ?
                           settings.isLactoseFree = false :
                           settings.isLactoseFree = true;
                           return  widget.onSettingsChanged(settings); 
                         }); 
                       },
                    ),
                   ),
                 ),
                 Divider(),
                 Padding(
                   padding: const EdgeInsets.only(
                     left: 8,
                     right: 8,
                     bottom: 8,
                   ),
                   child: Card(
                     color: Theme.of(context).accentColor,
                     elevation:  0.0,
                     child: _listTileSwitch(
                       title: 'Vegana',
                       subtitle: 'Só exibe refeições veganas!',
                       value: settings.isVegan,
                       onChanged: () {
                         return setState(() {
                           settings.isVegan == true ?
                           settings.isVegan = false :
                           settings.isVegan = true;
                           return  widget.onSettingsChanged(settings);
                         }); 
                       },
                    ),
                   ),
                 ),
                 Divider(),
                 Padding(
                   padding: const EdgeInsets.only(
                     left: 8,
                     right: 8,
                     bottom: 8,
                   ),
                   child: Card(
                     color: Theme.of(context).accentColor,
                     elevation:  0.0,
                     child: _listTileSwitch(
                       title: 'Vegetariana',
                       subtitle: 'Só exibe refeições vegetarianas!',
                       value: settings.isVegetarian,
                       onChanged: () {
                         return setState(() {
                           settings.isVegetarian == true ?
                           settings.isVegetarian = false :
                           settings.isVegetarian = true;
                           return  widget.onSettingsChanged(settings);
                         }); 
                       },
                    ),
                   ),
                 ),
                ],),
              ),
            )
          ],
        ),
      ),
    );
  }
}