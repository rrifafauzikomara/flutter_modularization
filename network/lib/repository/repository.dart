import 'package:network/model/movie.dart';
import 'package:network/network/api_provider.dart';

class Repository {

  final apiProvider = ApiProvider();
  Future<Movie> fetchAllMovie() => apiProvider.getMovieList();

}