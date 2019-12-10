import 'package:flutter_modularization/model/meals.dart';
import 'package:flutter_modularization/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealsListBloc {

  final _repository = Repository();
  final _mealsFetcher = PublishSubject<MealsResult>();

  Observable<MealsResult> get allMeals => _mealsFetcher.stream;

  fetchAllMeals(String mealsType) async {
    MealsResult mealsList = await _repository.fetchAllMeals(mealsType);
    _mealsFetcher.sink.add(mealsList);
  }

  dispose() {
    _mealsFetcher.close();
  }
}