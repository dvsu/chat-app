import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';
import 'package:chat_app/utilities/color_palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_app/widgets/buttons.dart';
import 'dart:math' as math;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: Duration(seconds: 1, milliseconds: 200),
      vsync: this,
      lowerBound: 0.1,
      upperBound: 0.7,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil().setWidth(MediaQuery.of(context).size.width);
    ScreenUtil().setHeight(MediaQuery.of(context).size.height);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
            center: Alignment(-1.1, -1.1),
            startAngle: 0,
            endAngle: (math.pi * animation.value) + 20.0,

            //center: Alignment(-0.5, -1.0),
            colors: [
              Color(0x77fffbd1).withOpacity(animation.value),
              Color(0x77ffcfba).withOpacity(animation.value),
              Color(0x77ffc7d7).withOpacity(animation.value),
              //Color(0xbb6A2C70),
            ],
            stops: [
              0.00,
              0.03,
              0.07,
              //0.15,
            ],
          ),
        ),
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
                      flex: 0.4.sw.toInt(),
                      child: Hero(
                        tag: 'app_icon',
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                              0.0.sw, 0.08.sh, 0.00.sw, 0.06.sh),
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              'images/app_icon.png',
                              //width: controller.value,
                            ),
                            //height: 100.0,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 0.6.sw.toInt(),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: AnimatedTextKit(
                          animatedTexts: [
                            ColorizeAnimatedText(
                              'chat app',
                              textAlign: TextAlign.left,
                              textStyle: welcomeScreenTitleTextStyle,
                              colors: titleGradientColor,
                              speed: Duration(milliseconds: 800),
                            ),
                          ],
                          //isRepeatingAnimation: true,
                          onTap: () {
                            print("Tap Event");
                          },
                          totalRepeatCount: 1,
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
                  child: CustomElevatedButton(
                    buttonText: 'LOG IN',
                    color: Color(0xff6A2C70),
                    onPress: () {
                      Navigator.pushNamed(context, '/login');
                    },
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
                  child: CustomElevatedButton(
                    buttonText: 'REGISTER',
                    color: Color(0xffF08A5D),
                    onPress: () {
                      Navigator.pushNamed(context, '/registration');
                    },
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
