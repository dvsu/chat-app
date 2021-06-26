import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: mainBackgroundDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 3,
                child: Container(),
              ),
              Expanded(
                flex: 3,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 2,
                      child: Hero(
                        tag: 'app_icon',
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(10.0, 0.0, 15.0, 0.0),
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Image.asset(
                              'images/app_icon.png',
                              colorBlendMode: BlendMode.difference,
                            ),
                            //height: 100.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'CHAT APP',
                          textAlign: TextAlign.left,
                          style: welcomeScreenTitleTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    elevation: 5.0,
                    color: Color(0xff6A2C70),
                    borderRadius: BorderRadius.circular(30.0),
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'LOG IN',
                        style: loginButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Material(
                    color: Color(0xffF08A5D),
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 5.0,
                    child: MaterialButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/registration');
                      },
                      minWidth: 200.0,
                      height: 42.0,
                      child: Text(
                        'REGISTER',
                        style: registerButtonTextStyle,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
