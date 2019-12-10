import 'package:flutter/material.dart';

class HeroAnimation extends StatelessWidget {

  final String tag;
  final String photo;
  final VoidCallback onTap;
  final double width;

  const HeroAnimation({Key key, this.tag, this.photo, this.onTap, this.width}) : super(key: key);

  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Hero(
        tag: tag,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: onTap,
            child: Image.network(
              photo,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}