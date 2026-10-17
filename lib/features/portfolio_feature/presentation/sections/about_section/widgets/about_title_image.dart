import 'package:flutter/material.dart';

class AboutTitleImage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "lib/assets/images/personal_picture.webp",
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
