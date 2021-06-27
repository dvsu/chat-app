import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/color_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElevatedButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPress;
  final Color color;

  const CustomElevatedButton(
      {required this.buttonText, required this.color, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPress,
      child: Text(
        buttonText,
        style: loginButtonTextStyle,
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(
          color,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              30.r,
            ),
          ),
        ),
        elevation: MaterialStateProperty.all(5.0),
      ),
    );
  }
}
