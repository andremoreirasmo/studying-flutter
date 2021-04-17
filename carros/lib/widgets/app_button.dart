import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgess;

  AppButton({Key key, this.text, this.onPressed, this.showProgess = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: ElevatedButton(
        child: showProgess
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
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
