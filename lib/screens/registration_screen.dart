import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        decoration: registrationBackgroundDecoration,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 0.1.sh.toInt(),
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
                    'CHAT APP',
                    textAlign: TextAlign.center,
                    style: registrationScreenTitleTextStyle,
                  ),
                ),
              ),
              Expanded(
                flex: 0.1.sh.toInt(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0.025.sw,
                    0.03.sh,
                    .025.sw,
                    0.01.sh,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your email',
                      filled: true,
                      fillColor: Color(0xccfff8a1),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF08A5D), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB83B5E), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0.1.sh.toInt(),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    0.025.sw,
                    0.01.sh,
                    .025.sw,
                    0.03.sh,
                  ),
                  child: TextField(
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      filled: true,
                      fillColor: Color(0xccfff8a1),
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffF08A5D), width: 1.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Color(0xffB83B5E), width: 2.0),
                        borderRadius: BorderRadius.all(Radius.circular(32.0)),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0.115.sh.toInt(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.025.sh,
                    horizontal: 0.025.sw,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text(
                      'REGISTER',
                      style: loginButtonTextStyle,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xffB83B5E),
                      ),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            30.r,
                          ),
                        ),
                      ),
                      elevation: MaterialStateProperty.all(5.0),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 0.29.sh.toInt(),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
