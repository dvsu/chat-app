import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';

final spinkit = SpinKitFadingCircle(
  itemBuilder: (BuildContext context, int index) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: index.isEven ? Color(0xffffffff) : Color(0xffbcbcbc),
        shape: BoxShape.circle,
      ),
    );
  },
);
