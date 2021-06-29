import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/theme/textstyling.dart';

class CustomMessageContainer extends StatelessWidget {
  CustomMessageContainer(
      {required this.message,
      required this.sender,
      required this.currentUserEmail,
      required this.time});

  final String message;
  final String sender;
  final String currentUserEmail;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(0.015.sh),
      child: (currentUserEmail == sender)
          ? SenderMessageContainer(
              sender: sender,
              message: message,
              time: time,
            )
          : ReceiverMessageContainer(
              sender: sender,
              message: message,
              time: time,
            ),
    );
  }
}

class SenderMessageContainer extends StatelessWidget {
  SenderMessageContainer({
    required this.sender,
    required this.message,
    required this.time,
  });

  final String sender;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 0.02.sh),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.only(right: 0.008.sw, bottom: 0.001.sh),
                child: Text(
                  time,
                  style: timeMessageContainerTextStyle,
                ),
                alignment: Alignment.centerRight,
              ),
              Container(
                constraints: BoxConstraints(
                  maxWidth: 0.6.sw,
                ),
                padding:
                    EdgeInsets.fromLTRB(0.015.sh, 0.015.sh, 0.015.sh, 0.015.sh),
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
                    topRight: Radius.circular(5.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x22121212),
                      offset: Offset(-1.0, 0.1),
                      blurRadius: 3.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
                child: Text(
                  message,
                  textAlign: TextAlign.end,
                  style: senderMessageContainerTextStyle,
                ),
              ),
            ],
          ),
        ),
        VerticalDivider(
          width: 0.02.sw,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: CircleAvatar(
            radius: 0.06.sw,
            backgroundColor: Color(0xee6A2C70),
            child: Text(
              sender[0].toUpperCase(),
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ReceiverMessageContainer extends StatelessWidget {
  ReceiverMessageContainer({
    required this.sender,
    required this.message,
    required this.time,
  });

  final String sender;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
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
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 0.02.sh),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: 0.6.sw,
                ),
                padding:
                    EdgeInsets.fromLTRB(0.015.sh, 0.015.sh, 0.015.sh, 0.015.sh),
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
                    topLeft: Radius.circular(5.0),
                    topRight: Radius.circular(15.0),
                    bottomLeft: Radius.circular(15.0),
                    bottomRight: Radius.circular(15.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x22121212),
                      offset: Offset(-1.0, 1.0),
                      blurRadius: 3.0,
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
            ),
            Container(
              padding: EdgeInsets.only(left: 0.008.sw, bottom: 0.001.sh),
              child: Text(
                time,
                style: timeMessageContainerTextStyle,
              ),
              alignment: Alignment.centerRight,
            ),
          ],
        ),
      ],
    );
  }
}
