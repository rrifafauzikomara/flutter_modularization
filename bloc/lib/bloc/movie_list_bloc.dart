import 'package:rxdart/rxdart.dart';

import 'package:network/network.dart';

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