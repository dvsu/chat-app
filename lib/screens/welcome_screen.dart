import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil().setWidth(MediaQuery.of(context).size.width);
    ScreenUtil().setHeight(MediaQuery.of(context).size.height);

    print(MediaQuery.of(context).size.width);
    print(MediaQuery.of(context).size.height);
    print('width ${ScreenUtil().screenWidth}');
    print('height ${ScreenUtil().screenHeight}');
    print(100.r);
    print(100.h);
    print(100.w);
    print(1.sw);
    print(1.sh);
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
                flex: 0.25.sh.toInt(),
                child: Container(),
              ),
              Expanded(
                flex: 0.27.sh.toInt(),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 4.r.toInt(),
                      child: Hero(
                        tag: 'app_icon',
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0.03.sw, 0.07.sh, 0.01.sw, 0.07.sh),
                          child: Container(
                            alignment: Alignment.center,
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
                      flex: 6.r.toInt(),
                      child: Container(
                        alignment: Alignment.centerLeft,
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
              Expanded(
                flex: 0.115.sh.toInt(),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 0.025.sh,
                    horizontal: 0.025.sw,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/login');
                    },
                    child: Text(
                      'LOG IN',
                      style: loginButtonTextStyle,
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color(0xff6A2C70),
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
                flex: 0.25.sh.toInt(),
                child: Container(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
