import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomMessageContainer extends StatelessWidget {
  CustomMessageContainer({required this.message, required this.sender});

  final String message;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.01.sw),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Expanded(
          //   flex: 0.2.sw.toInt(),
          //   child: Container(),
          // ),
          Container(
            constraints: BoxConstraints(
              maxWidth: 0.7.sw,
            ),
            padding: EdgeInsets.all(0.03.sw),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-1.2, -2.5),
                end: Alignment(1.0, 3.0),
                stops: [
                  0.0,
                  0.5,
                  1.0,
                ],
                colors: [
                  //Color(0xddF9ED69),
                  Color(0xeeF08A5D),
                  Color(0xeeB83B5E),
                  Color(0xee6A2C70),
                ],
              ),
              borderRadius: BorderRadius.circular(15.0),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22121212),
                  offset: Offset(0.0, 0.1),
                  blurRadius: 2,
                  spreadRadius: 1.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Text(sender),
                Text(
                  message,
                  textAlign: TextAlign.end,
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          VerticalDivider(
            width: 0.02.sw,
          ),
          CircleAvatar(
            radius: 0.06.sw,
            backgroundColor: Color(0xddF08A5D),
            child: Text(
              sender[0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
