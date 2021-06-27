import 'package:flutter/material.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/widgets/buttons.dart';

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
      lowerBound: 0.3,
      upperBound: 0.9,
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeInOut);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print(controller.value);
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
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            radius: 3.2,
            focal: Alignment(animation.value - 1.5, animation.value - 2.3),
            focalRadius: 0.3,
            //center: Alignment(-0.5, -1.0),
            colors: [
              Color(0xddF9ED69).withOpacity(animation.value),
              Color(0xddF08A5D).withOpacity((animation.value / 3) + 0.6),
              Color(0xeeB83B5E).withOpacity((animation.value / 2) + 0.5),
              Color(0xff6A2C70),
            ],
            stops: [
              animation.value - 1.0,
              (animation.value / 3.5) - 0.12,
              (animation.value / 15) + 0.22,
              (animation.value / 30) + 0.38,
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
                              //width: controller.value,
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
