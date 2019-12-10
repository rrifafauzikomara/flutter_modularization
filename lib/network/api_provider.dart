import 'dart:async';
import 'package:http/http.dart' show Client;
import 'dart:convert';

import 'package:flutter_modularization/model/meals.dart';

class ApiProvider {
  Client client = Client();

  static final String _baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<MealsResult> getMealsList(String mealsType) async {
    final response = await client.get(_baseUrl +"filter.php?c=$mealsType");
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }

  Future<MealsResult> getDetailMeals(String mealsId) async {
    final response = await client.get(_baseUrl + 'lookup.php?i=$mealsId');
    if (response.statusCode == 200) {
      return MealsResult.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load meals');
    }
  }
}