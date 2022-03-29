import 'package:network/network.dart';
import 'package:repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc {

  final _repository = Repository();
  final _movieFetcher = PublishSubject<Movie>();

  Stream<Movie> get allMovie => _movieFetcher.stream;

  fetchAllMovie() async {
    Movie movie = await _repository.fetchAllMovie();
    _movieFetcher.sink.add(movie);
  }

  dispose() {
    _movieFetcher.close();
  }
}