import 'package:flutter/material.dart';

const InputDecoration messageTextFieldDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  hintText: 'Type your message here...',
  border: InputBorder.none,
);

const BoxDecoration messageContainerDecoration = BoxDecoration(
  border: Border(
    top: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
  ),
);

const BoxDecoration mainBackgroundDecoration = BoxDecoration(
  gradient: RadialGradient(
    radius: 2.5,
    focal: Alignment(-0.4, -1.6),
    focalRadius: 0.6,
    //center: Alignment(-0.5, -1.0),
    colors: [
      Color(0xddF9ED69),
      Color(0xddF08A5D),
      Color(0xddB83B5E),
      Color(0xdd6A2C70),
    ],
    stops: [
      -1.0,
      0.25,
      0.5,
      0.6,
    ],
  ),
);
