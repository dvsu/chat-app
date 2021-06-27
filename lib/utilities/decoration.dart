import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';

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

const InputDecoration registrationInputDecoration = InputDecoration(
  hintStyle: hintTextStyle,
  filled: true,
  fillColor: Color(0xccffffff),
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xffF08A5D), width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color(0xff6A2C70), width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
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

const BoxDecoration registrationBackgroundDecoration = BoxDecoration(
  gradient: RadialGradient(
    radius: 2.5,
    focal: Alignment(0.0, -1.9),
    focalRadius: 0.6,
    //center: Alignment(-0.5, -1.0),
    colors: [
      Color(0xeeF9ED69),
      Color(0xeeF08A5D),
      Color(0xeeB83B5E),
      Color(0xee6A2C70),
    ],
    stops: [
      -1.0,
      0.2,
      0.4,
      0.5,
    ],
  ),
);

const BoxDecoration loginBackgroundDecoration = BoxDecoration(
  gradient: RadialGradient(
    radius: 2.5,
    focal: Alignment(1.0, -1.9),
    focalRadius: 0.6,
    //center: Alignment(-0.5, -1.0),
    colors: [
      Color(0xeeF9ED69),
      Color(0xeeF08A5D),
      Color(0xeeB83B5E),
      Color(0xee6A2C70),
    ],
    stops: [
      -1.0,
      0.2,
      0.4,
      0.55,
    ],
  ),
);
