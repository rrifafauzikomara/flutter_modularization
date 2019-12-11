import 'package:flutter/material.dart';
import 'package:flutter_modularization/widget/movie_detail_header.dart';

class DetailPage extends StatelessWidget {

  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final int rating;

  const DetailPage({Key key, this.genre, this.title, this.imageBanner, this.imagePoster, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MovieDetailHeader(
              title: title,
              imageBanner: imageBanner,
              imagePoster: imagePoster,
              rating: rating,
              genre: genre,
            ),
            SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }

}
