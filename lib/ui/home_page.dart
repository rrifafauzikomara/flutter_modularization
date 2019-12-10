import 'package:flutter/material.dart';
import 'package:flutter_modularization/animation/hero_animation.dart';
import 'package:flutter_modularization/bloc/meals_list_bloc.dart';
import 'package:flutter_modularization/model/meals.dart';
import 'package:flutter_modularization/ui/detail_page.dart';

class HomePage extends StatefulWidget {

  final String title;

  const HomePage({Key key, this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final bloc = MealsListBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMeals('Dessert');
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: getListDesert(),
    );
  }

  getListDesert() {
    return Container(
      color: Color.fromRGBO(58, 66, 86, 1.0),
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMeals,
          builder: (context, AsyncSnapshot<MealsResult> snapshot) {
            if (snapshot.hasData) {
              return _showListDessert(snapshot);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return Center(child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
            ));
          },
        ),
      ),
    );
  }

  Widget _showListDessert(AsyncSnapshot<MealsResult> snapshot) => GridView.builder(
    itemCount: snapshot == null ? 0 : snapshot.data.meals.length,
    gridDelegate:
    SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
    itemBuilder: (BuildContext context, int index) {
      return GestureDetector(
        child: Card(
          elevation: 2.0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5))),
          margin: EdgeInsets.all(10),
          child: GridTile(
            child: HeroAnimation(
              tag: snapshot.data.meals[index].strMeal,
              onTap: () {
                Navigator.push(
                    context,
                    PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 777),
                      pageBuilder: (BuildContext context, Animation<double> animation,
                          Animation<double> secondaryAnimation) =>
                          DetailPage(
                              idMeal: snapshot.data.meals[index].idMeal,
                              strMeal: snapshot.data.meals[index].strMeal,
                              strMealThumb: snapshot.data.meals[index].strMealThumb),
                    ));
              },
              photo: snapshot.data.meals[index].strMealThumb,
            ),
            footer: Container(
              color: Colors.white70,
              padding: EdgeInsets.all(5.0),
              child: Text(
                snapshot.data.meals[index].strMeal,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.deepOrange),
              ),
            ),
          ),
        ),
      );
    },
  );

}
