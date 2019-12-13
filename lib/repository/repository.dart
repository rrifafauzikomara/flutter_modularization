import 'package:flutter_modularization/network/api/api_provider.dart';
import 'package:flutter_modularization/network/model/movie.dart';

class Repository {

  final apiProvider = ApiProvider();

  Future<Movie> fetchAllMovie() => apiProvider.getMovieList();

}