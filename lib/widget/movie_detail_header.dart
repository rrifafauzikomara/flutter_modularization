import 'package:flutter/material.dart';
import 'package:flutter_modularization/widget/arc_banner_image.dart';
import 'package:flutter_modularization/widget/poster.dart';
import 'package:flutter_modularization/widget/rating_information.dart';

class MovieDetailHeader extends StatelessWidget {

  final List<Widget> genre;
  final String title;
  final String imageBanner;
  final String imagePoster;
  final int rating;

  const MovieDetailHeader({Key key, this.genre, this.title, this.imageBanner, this.imagePoster, this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var movieInformation = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
        ),
        SizedBox(height: 8.0),
        RatingInformation(rating: rating,),
        SizedBox(height: 12.0),
        Padding(
          padding: EdgeInsets.only(right: 8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children:
              genre,
            ),
          ),
        ),
      ],
    );

    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 140.0),
          child: ArcBannerImage(imageBanner),
        ),
        Positioned(
          bottom: 0.0,
          left: 16.0,
          right: 16.0,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Poster(
                imagePoster,
                height: 180.0,
              ),
              SizedBox(width: 16.0),
              Expanded(child: movieInformation),
            ],
          ),
        ),
      ],
    );
  }
}
