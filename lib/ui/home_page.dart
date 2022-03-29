import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modularization/ui/detail_page.dart';
import 'package:flutter_modularization/widget/card_list_movie.dart';
import 'package:flutter_modularization/widget/chip_genre_movie.dart';
import 'package:network/network.dart';

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final bloc = MovieListBloc();

  @override
  void initState() {
    super.initState();
    bloc.fetchAllMovie();
  }

  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(58, 66, 86, 1.0)),
        ),
      ),
      body: getListMovie(),
    );
  }

  Widget getListMovie() {
    return Container(
      child: Center(
        child: StreamBuilder(
          stream: bloc.allMovie,
          builder: (context, AsyncSnapshot<Movie> snapshot) {
            if (snapshot.hasData) {
              return showListMovie(snapshot);
            } else if (snapshot.hasError) {
              return Text(
                snapshot.error.toString(),
                style: TextStyle(color: Color.fromRGBO(58, 66, 86, 1.0)),
              );
            }
            return Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(
                  Color.fromRGBO(58, 66, 86, 1.0),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget showListMovie(AsyncSnapshot<Movie> snapshot) => ListView.builder(
        itemCount: snapshot.data == null ? 0 : snapshot.data?.results.length,
        itemBuilder: (BuildContext context, int index) {
          final movie = snapshot.data!.results[index];
          return GestureDetector(
            child: CardListMovies(
              image: 'https://image.tmdb.org/t/p/w185${movie.posterPath}',
              title: movie.title,
              vote: movie.voteAverage.toString(),
              releaseDate: movie.releaseDate,
              overview: movie.overview,
              genre: movie.genreIds.take(3).map(buildGenreChip).toList(),
            ),
            onTap: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: Duration(milliseconds: 777),
                    pageBuilder: (BuildContext context,
                        Animation<double> animation,
                        Animation<double> secondaryAnimation) {
                      return DetailPage(
                        title: movie.title,
                        imagePoster:
                            'https://image.tmdb.org/t/p/w185${movie.posterPath}',
                        rating: movie.voteAverage,
                        imageBanner:
                            'https://image.tmdb.org/t/p/original${movie.backdropPath}',
                        genre:
                            movie.genreIds.take(3).map(buildGenreChip).toList(),
                        overview: movie.overview,
                      );
                    }),
              );
            },
          );
        },
      );
}
