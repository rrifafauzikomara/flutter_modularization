import 'package:flutter_modularization/model/meals.dart';
import 'package:flutter_modularization/network/api_provider.dart';

class Repository {

  final apiProvider = ApiProvider();

  Future<MealsResult> fetchAllMeals(String mealsType) => apiProvider.getMealsList(mealsType);
  Future<MealsResult> fetchDetailMeals(String mealsId) => apiProvider.getDetailMeals(mealsId);

}