import 'package:flutter/material.dart';
import 'package:flutter_modularization/widget/movie_detail_header.dart';
import 'package:flutter_modularization/widget/story_line.dart';

class DetailPage extends StatelessWidget {

  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final double rating;
  final String overview;

  const DetailPage({Key key, this.genre, this.title, this.imageBanner, this.imagePoster, this.rating, this.overview}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: [
                MovieDetailHeader(
                  title: title,
                  imageBanner: imageBanner,
                  imagePoster: imagePoster,
                  rating: rating,
                  genre: genre,
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Storyline(overview),
                ),
                SizedBox(height: 50.0),
              ],
            ),
            Positioned(
              top: 20,
              left: 5,
              child: IconButton(icon: Icon(Icons.arrow_back), onPressed: () => Navigator.pop(context)),
            ),
          ],
        )
      ),
    );
  }
}