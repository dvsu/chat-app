import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/theme/textstyling.dart';
import 'package:chat_app/theme/decoration.dart';
import 'package:chat_app/widgets/buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_app/widgets/dialogs.dart';
import 'package:chat_app/utilities/string_extension.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:chat_app/widgets/progress_indicators.dart';

class RegistrationScreen extends StatefulWidget {
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;
  late String email;
  late String password;
  bool inProgress = false;

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
      body: ModalProgressHUD(
        inAsyncCall: inProgress,
        progressIndicator: spinkit,
        opacity: 0.5,
        child: Container(
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
                (animation.value / 3.2) - 0.16,
                (animation.value / 15) + 0.2,
                (animation.value / 30) + 0.35,
              ],
            ),
          ),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 0.05.sw, vertical: 0.1.sh),
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
                        buttonText: 'REGISTER',
                        color: Color(0xffF08A5D),
                        onPress: () async {
                          setState(() {
                            inProgress = true;
                          });
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                                    email: email, password: password);
                            Navigator.pushNamed(context, '/chat');
                            setState(() {
                              inProgress = false;
                            });
                          } on FirebaseAuthException catch (e) {
                            setState(() {
                              inProgress = false;
                            });
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext context) =>
                                    CustomAlertDialog(
                                      title: e.code
                                          .replaceAll(RegExp('-'), ' ')
                                          .capitalize(),
                                      content: e.message,
                                    ));
                            print('Failed with error code: ${e.code}');
                            print(e.message);
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
      ),
    );
  }
}
