import 'package:flutter_modularization/model/movie.dart';
import 'package:flutter_modularization/network/api_provider.dart';

class Repository {

  final apiProvider = ApiProvider();

  Future<Movie> fetchAllMovie() => apiProvider.getMovieList();

}