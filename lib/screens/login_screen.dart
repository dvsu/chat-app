import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';
import 'package:chat_app/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: loginBackgroundDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.1.sh),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0x55ffffff),
                  Color(0x0affffff),
                ],
              ),
              borderRadius: BorderRadius.circular(0.05.sw),
              boxShadow: [
                BoxShadow(
                  color: Color(0x22121212),
                  offset: Offset(0, 2),
                  blurRadius: 1.0,
                  spreadRadius: 2.0,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 0.05.sh.toInt(),
                  child: Container(),
                ),
                Expanded(
                  flex: 0.15.sh.toInt(),
                  child: Hero(
                    tag: 'app_icon',
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 100.0,
                        alignment: Alignment.bottomCenter,
                        child: Image.asset('images/app_icon.png'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.095.sh.toInt(),
                  child: Container(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'chat app',
                      textAlign: TextAlign.center,
                      style: registrationScreenTitleTextStyle,
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.1.sh.toInt(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.07.sw,
                      vertical: 0.01.sh,
                    ),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      style: textFieldTextStyle,
                      onChanged: (value) {
                        email = value;
                      },
                      decoration: registrationInputDecoration.copyWith(
                        hintText: 'Enter your email',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.1.sh.toInt(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 0.07.sw,
                      vertical: 0.01.sh,
                    ),
                    child: TextField(
                      obscureText: true,
                      style: textFieldTextStyle,
                      onChanged: (value) {
                        password = value;
                      },
                      decoration: registrationInputDecoration.copyWith(
                        hintText: 'Enter your password',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.115.sh.toInt(),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 0.025.sh,
                      horizontal: 0.07.sw,
                    ),
                    child: CustomElevatedButton(
                      buttonText: 'LOG IN',
                      color: Color(0xff6A2C70),
                      onPress: () async {
                        try {
                          await _auth
                              .signInWithEmailAndPassword(
                                  email: email, password: password)
                              .then((value) {
                            Navigator.pushNamed(context, '/chat');
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 0.19.sh.toInt(),
                  child: Container(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
