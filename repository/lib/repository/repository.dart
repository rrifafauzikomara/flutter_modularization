import 'package:network/network.dart';

class Repository {

  final apiProvider = ApiProvider();
  Future<Movie> fetchAllMovie() => apiProvider.getMovieList();

}