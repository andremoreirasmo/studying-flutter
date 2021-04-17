import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  AppButton({
    Key key,
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        child: Text(
          text,
          style: TextStyle(
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
