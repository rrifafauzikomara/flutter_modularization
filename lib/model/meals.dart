class MealsResult {
  List<Meals> meals;

  MealsResult({this.meals});

  MealsResult.fromJson(Map<String, dynamic> json) {
    if (json['meals'] != null) {
      meals = new List<Meals>();
      json['meals'].forEach((v) {
        meals.add(new Meals.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meals != null) {
      data['meals'] = this.meals.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Meals {
  String idMeal;
  String strMeal;
  String strCategory;
  String strArea;
  String strInstructions;
  String strMealThumb;
  String strIngredient1;
  String strIngredient2;
  String strIngredient3;
  String strIngredient4;
  String strIngredient5;

  Meals(
      {this.idMeal,
        this.strMeal,
        this.strCategory,
        this.strArea,
        this.strInstructions,
        this.strMealThumb,
        this.strIngredient1,
        this.strIngredient2,
        this.strIngredient3,
        this.strIngredient4,
        this.strIngredient5});

  Meals.fromJson(Map<String, dynamic> json) {
    idMeal = json['idMeal'];
    strMeal = json['strMeal'];
    strCategory = json['strCategory'];
    strArea = json['strArea'];
    strInstructions = json['strInstructions'];
    strMealThumb = json['strMealThumb'];
    strIngredient1 = json['strIngredient1'];
    strIngredient2 = json['strIngredient2'];
    strIngredient3 = json['strIngredient3'];
    strIngredient4 = json['strIngredient4'];
    strIngredient5 = json['strIngredient5'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idMeal'] = this.idMeal;
    data['strMeal'] = this.strMeal;
    data['strCategory'] = this.strCategory;
    data['strArea'] = this.strArea;
    data['strInstructions'] = this.strInstructions;
    data['strMealThumb'] = this.strMealThumb;
    data['strIngredient1'] = this.strIngredient1;
    data['strIngredient2'] = this.strIngredient2;
    data['strIngredient3'] = this.strIngredient3;
    data['strIngredient4'] = this.strIngredient4;
    data['strIngredient5'] = this.strIngredient5;
    return data;
  }
}