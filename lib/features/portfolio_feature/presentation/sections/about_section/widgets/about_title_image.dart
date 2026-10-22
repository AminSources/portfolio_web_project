import 'package:flutter/material.dart';

class AboutTitleImage extends StatelessWidget {
  final double? width;

  const new({super.key, this.width});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "lib/assets/images/personal_picture.webp",
      width: width,
      fit: BoxFit.cover,
    );
  }
}
