import 'package:flutter/material.dart';

class CustomBackgroundImage extends StatelessWidget {
  const CustomBackgroundImage({super.key, this.width, this.height, required this.backgroundImage});

  final double? width;
  final double? height;
  final String backgroundImage;

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      decoration: BoxDecoration(
        image:  DecorationImage(
          image: AssetImage(backgroundImage),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
