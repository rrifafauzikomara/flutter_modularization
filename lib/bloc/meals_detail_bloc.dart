import 'package:flutter_modularization/model/meals.dart';
import 'package:flutter_modularization/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MealsDetailBloc {

  final _repository = Repository();
  final _mealsDetailFetcher = PublishSubject<MealsResult>();
  Observable<MealsResult> get detailMeals => _mealsDetailFetcher.stream;

  fetchDetailMeals(String mealsId) async {
    MealsResult mealsDetail = await _repository.fetchDetailMeals(mealsId);
    _mealsDetailFetcher.sink.add(mealsDetail);
  }

  dispose() {
    _mealsDetailFetcher.close();
  }
}