import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/utilities/textstyling.dart';
import 'package:chat_app/utilities/decoration.dart';
import 'package:chat_app/widgets/buttons.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
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
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
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
                    style: textFieldTextStyle,
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
                            BorderSide(color: Color(0xff6A2C70), width: 2.0),
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
                    obscureText: true,
                    style: textFieldTextStyle,
                    onChanged: (value) {
                      //Do something with the user input.
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter your password',
                      hintStyle: hintTextStyle,
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
                            BorderSide(color: Color(0xff6A2C70), width: 2.0),
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
