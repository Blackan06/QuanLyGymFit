import 'package:flutter/material.dart';

class OnBordingButton extends StatelessWidget {
  final VoidCallback passHandler;
  final String text;
  OnBordingButton(this.passHandler, this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(text),
        onPressed: passHandler,
      ),
    );
  }
}
