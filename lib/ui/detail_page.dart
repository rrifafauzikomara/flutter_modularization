import 'package:flutter/material.dart';
import 'package:flutter_modularization/model/meals.dart';
import 'package:flutter_modularization/network/api_provider.dart';

class DetailPage extends StatefulWidget {

  final String idMeal;
  final String strMeal;
  final String strMealThumb;

  const DetailPage({Key key, this.idMeal, this.strMeal, this.strMealThumb}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(58, 66, 86, 1.0),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 270,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text(widget.strMeal.length > 24 ? widget.strMeal.substring(0, 24) : widget.strMeal,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                  ),
                ),
                background: Hero(
                  tag: widget.strMeal,
                  child: Material(
                    child: InkWell(
                      child: Image.network(
                          widget.strMealThumb,
                          width: double.infinity,
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
              ),
            ),
          ];
        },
        body: getListDetail(),
      ),
    );
  }

  getListDetail() {
    return FutureBuilder(
        future: ApiProvider().getDetailMeals(widget.idMeal),
        builder: (context, AsyncSnapshot<MealsResult> snapshot) {
          if (snapshot.hasData) {
            return _showListDetail(
                snapshot.data.meals[0].strCategory,
                snapshot.data.meals[0].strArea,
                snapshot.data.meals[0].strIngredient1,
                snapshot.data.meals[0].strIngredient2,
                snapshot.data.meals[0].strIngredient3,
                snapshot.data.meals[0].strIngredient4,
                snapshot.data.meals[0].strIngredient5,
                snapshot.data.meals[0].strInstructions);
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          return Center(child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white)
          ));
        });
  }

  Widget _showListDetail(
      String category,
      String area,
      String ingredient1,
      String ingredient2,
      String ingredient3,
      String ingredient4,
      String ingredient5,
      String desc) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Category : ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    category,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Row(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Area : ",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    area,
                    style: TextStyle(
                        fontStyle: FontStyle.normal,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Ingredient :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    ingredient1+ ', ' +
                        ingredient1 + ', ' +
                        ingredient2 + ', ' +
                        ingredient3 + ', ' +
                        ingredient4 + ', ' +
                        ingredient5,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: Column(
              children: <Widget>[
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Instructions :",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    desc,
                    style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

}
