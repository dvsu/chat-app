import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/theme/textstyling.dart';

class CustomMessageContainer extends StatelessWidget {
  CustomMessageContainer(
      {required this.message,
      required this.sender,
      required this.currentUserEmail});

  final String message;
  final String sender;
  final String currentUserEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.01.sw),
      child: Row(
        mainAxisAlignment: (currentUserEmail == sender)
            ? MainAxisAlignment.end
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          (currentUserEmail == sender)
              ? Container(
                  constraints: BoxConstraints(
                    maxWidth: 0.6.sw,
                  ),
                  padding: EdgeInsets.fromLTRB(
                      0.015.sh, 0.015.sh, 0.015.sh, 0.015.sh),
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
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.zero,
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x22121212),
                        offset: Offset(0.0, 0.1),
                        blurRadius: 2,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.end,
                    style: senderMessageContainerTextStyle,
                  ),
                )
              : CircleAvatar(
                  radius: 0.06.sw,
                  backgroundColor: Color(0xee6A2C70),
                  child: Text(
                    sender[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
          VerticalDivider(
            width: 0.02.sw,
          ),
          (currentUserEmail == sender)
              ? CircleAvatar(
                  radius: 0.06.sw,
                  backgroundColor: Color(0xee6A2C70),
                  child: Text(
                    sender[0].toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(
                  constraints: BoxConstraints(
                    maxWidth: 0.6.sw,
                  ),
                  padding: EdgeInsets.fromLTRB(
                      0.015.sh, 0.015.sh, 0.015.sh, 0.015.sh),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.2, -2.5),
                      end: Alignment(1.0, 3.0),
                      stops: [
                        0.0,
                        0.95,
                        1.0,
                      ],
                      colors: [
                        Color(0xddF9ED69),
                        Color(0xeeF08A5D),
                        Color(0xeeB83B5E),
                      ],
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.zero,
                      topRight: Radius.circular(15.0),
                      bottomLeft: Radius.circular(15.0),
                      bottomRight: Radius.circular(15.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x22121212),
                        offset: Offset(0.0, 0.1),
                        blurRadius: 2,
                        spreadRadius: 1.0,
                      ),
                    ],
                  ),
                  child: Text(
                    message,
                    textAlign: TextAlign.start,
                    style: receiverMessageContainerTextStyle,
                  ),
                ),
        ],
      ),
    );
  }
}
