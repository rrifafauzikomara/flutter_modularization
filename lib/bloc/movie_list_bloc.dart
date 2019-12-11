import 'package:flutter_modularization/model/movie.dart';
import 'package:flutter_modularization/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class MovieListBloc {

  final _repository = Repository();
  final _movieFetcher = PublishSubject<Movie>();

  Observable<Movie> get allMovie => _movieFetcher.stream;

  fetchAllMovie() async {
    Movie movie = await _repository.fetchAllMovie();
    _movieFetcher.sink.add(movie);
  }

  dispose() {
    _movieFetcher.close();
  }
}