import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'clipper_image.dart';

class ArcBannerImage extends StatelessWidget {

  ArcBannerImage(this.imageUrl);
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return ClipPath(
      clipper: ClipperImage(),
      child: Container(
        width: screenWidth,
        height: 230.0,
        child: CachedNetworkImage(
          fit: BoxFit.cover,
          imageUrl: imageUrl,
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
      )
    );
  }
}