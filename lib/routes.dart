import 'package:flutter/widgets.dart';
import 'package:chat_app/screens/welcome_screen.dart';
import 'package:chat_app/screens/registration_screen.dart';
import 'package:chat_app/screens/login_screen.dart';
import 'package:chat_app/screens/chat_screen.dart';

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  '/welcome': (BuildContext context) => WelcomeScreen(),
  '/registration': (BuildContext context) => RegistrationScreen(),
  '/login': (BuildContext context) => LoginScreen(),
  '/chat': (BuildContext context) => ChatScreen()
};
