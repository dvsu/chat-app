import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/theme/textstyling.dart';
import 'package:chat_app/theme/decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:chat_app/screens/chat_screen/widgets/message_containers.dart';
import 'package:chat_app/utilities/datetime_formatter.dart';

final _firestore = FirebaseFirestore.instance;
final _auth = FirebaseAuth.instance;
User? user = _auth.currentUser;

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final ScrollController messageScrollController = ScrollController();
  late User currentUser;
  String message = '';
  bool messageStateChanged = false;
  bool messageBeforeIsEmpty = true;
  bool messageNowIsEmpty = true;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      user = _auth.currentUser;
      print(user);
      if (user != null) {
        currentUser = user!;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage(String message) {
    CollectionReference messages = _firestore.collection('messages');

    return messages.add({
      'sender': currentUser.email,
      'text': message,
      'timestamp': DateTime.now()
    }).then((value) {
      print("Message sent");
    }).catchError((e) {
      print('$e');
    });
  }

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: isKeyboardVisible ? 0.15.sh.toInt() : 0.12.sh.toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(-1.2, -2.5),
                      end: Alignment(1.0, 3.0),
                      stops: [
                        0.0,
                        0.5,
                        1.0,
                      ],
                      colors: [
                        //Color(0xddF9ED69),
                        Color(0xeeF08A5D),
                        Color(0xeeB83B5E),
                        Color(0xee6A2C70),
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 0.2.sw.toInt(),
                        child: Padding(
                          padding: EdgeInsets.all(0.03.sw),
                          child: CircleAvatar(
                            radius: 0.1.sh,
                            backgroundImage:
                                AssetImage('images/sample_avatar.jpg'),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 0.7.sw.toInt(),
                        child: Text(
                          'Gabriel Sommer',
                          style: receiverNameTextStyle,
                        ),
                      ),
                      Expanded(
                        flex: 0.1.sw.toInt(),
                        child: TextButton(
                            child: Icon(
                              Icons.logout_rounded,
                              size: 0.035.sh,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              _auth.signOut();
                              Navigator.pop(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0.81.sh.toInt(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [
                        0.3,
                        1.0,
                      ],
                      colors: [
                        Color(0x05121212),
                        Color(0x10121212),
                      ],
                    ),
                  ),
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        flex: 0.9.sh.toInt(),
                        child: MessageStream(
                          controller: messageScrollController,
                          currentUser: currentUser,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 0.12.sh.toInt(),
                child: Container(
                  decoration: messageContainerDecoration,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        flex:
                            (message == '') ? 1.0.sw.toInt() : 0.85.sw.toInt(),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextField(
                            showCursor: (isKeyboardVisible) ? true : false,
                            cursorColor: Color(0xee6A2C70),
                            controller: messageTextController,
                            onChanged: (value) {
                              message = value;
                              if (value.isNotEmpty) {
                                messageNowIsEmpty = false;
                              } else {
                                messageNowIsEmpty = true;
                              }
                              messageStateChanged =
                                  (messageBeforeIsEmpty != messageNowIsEmpty);
                              messageBeforeIsEmpty = messageNowIsEmpty;
                              if (messageStateChanged == true) {
                                setState(() {});
                              }
                            },
                            decoration: messageTextFieldDecoration,
                            style: messageTextFieldTextStyle,
                          ),
                        ),
                      ),
                      (message == '')
                          ? Container()
                          : Expanded(
                              flex: 0.15.sw.toInt(),
                              child: ElevatedButton(
                                onPressed: () async {
                                  messageTextController.clear();
                                  messageScrollController.jumpTo(
                                      messageScrollController
                                          .position.maxScrollExtent);
                                  await sendMessage(message);
                                  messageStateChanged = false;
                                  messageNowIsEmpty = true;
                                  messageBeforeIsEmpty = true;
                                  message = '';
                                  setState(() {});
                                },
                                child: Icon(
                                  Icons.send_rounded,
                                  color: Color(0xee6A2C70),
                                  size: 0.07.sw,
                                ),
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                  shadowColor: MaterialStateProperty.all(
                                      Colors.transparent),
                                ),
                              ),
                            ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}

class MessageStream extends StatelessWidget {
  MessageStream({required this.controller, required this.currentUser});

  final ScrollController controller;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _firestore
          .collection('messages')
          .orderBy('timestamp', descending: false)
          .snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            controller: controller,
            shrinkWrap: true,
            reverse: true,
            padding:
                EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.05.sw),
            children:
                snapshot.data!.docs.reversed.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return CustomMessageContainer(
                message: data['text'],
                sender: data['sender'],
                currentUserEmail: currentUser.email ?? '',
                time: DateTimeParser()
                    .datetimeToStringTime(data['timestamp'].toDate()),
              );
            }).toList(),
          );
        }
      },
    );
  }
}
