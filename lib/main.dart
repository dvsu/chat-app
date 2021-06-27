import 'package:flutter/material.dart';
import 'package:chat_app/routes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(ChatApp());

class ChatApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: ScreenUtil.defaultSize,
      builder: () => MaterialApp(
        builder: (context, widget) {
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget ?? Container(),
          );
        },
        debugShowCheckedModeBanner: false,
        title: 'Chat App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          //textTheme: TextTheme(button: TextStyle(fontSize: 45.sp)),
        ),
        initialRoute: '/',
        routes: routes,
      ),
    );
  }
}
