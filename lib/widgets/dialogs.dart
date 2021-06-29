import 'package:flutter/material.dart';
import 'package:chat_app/theme/textstyling.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title;
  final String? content;

  CustomAlertDialog({required this.title, this.content});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      titleTextStyle: alertDialogTitleTextStyle,
      content: Text(content ?? ''),
      contentTextStyle: alertDialogContentTextStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      actions: [
        Center(
          child: TextButton(
            child: Text(
              'Retry',
              style: alertDialogButtonTextStyle,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ],
    );
  }
}
