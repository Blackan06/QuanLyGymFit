import 'package:flutter/material.dart';

class ImageOnboarding extends StatelessWidget {
  final List<Map<String, Object>> imageOnbording;
  final Function nextImage;
  final int questionIndex;

  ImageOnboarding(
      {required this.imageOnbording,
      required this.nextImage,
      required this.questionIndex});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 15,
        bottom: 60,
        right: 15,
        top: 40,
      ),
      child: Image.asset(
        imageOnbording[questionIndex]['imageText'] as String,
        height: 310,
        width: 400,
      ),
    );
  }
}
