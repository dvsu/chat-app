import 'package:flutter/material.dart';
import 'package:chat_app/pages/welcome_page.dart';

void main() {
  runApp(ChatApp());
}

class ChatApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomePage(),
    );
  }
}
