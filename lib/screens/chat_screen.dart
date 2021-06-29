import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/theme/textstyling.dart';
import 'package:chat_app/theme/decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:chat_app/screens/chat_screen/widgets/message_containers.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late User userName;
  late String message;
  //bool isSent = false;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final User? user = _auth.currentUser;
      print(user);
      if (user != null) {
        userName = user;
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> sendMessage(String message) {
    CollectionReference messages = _firestore.collection('messages');
    return messages
        .add({'sender': userName.email, 'text': message}).then((value) {
      print("Message sent");
    }).catchError((e) {
      print('$e');
    });
  }

  StreamBuilder<QuerySnapshot<Map<String, dynamic>>> realTimeMessageSync() {
    return StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
      stream: _firestore.collection('messages').snapshots(),
      builder: (BuildContext context,
          AsyncSnapshot<QuerySnapshot<Map<String, dynamic>>> snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView(
            padding:
                EdgeInsets.symmetric(horizontal: 0.01.sw, vertical: 0.05.sw),
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return CustomMessageContainer(
                message: data['text'],
                sender: data['sender'],
              );
            }).toList(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 0.15.sh.toInt(),
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
              child: Column(
                children: [
                  Expanded(
                    flex: 0.05.sh.toInt(),
                    child: Container(),
                  ),
                  Expanded(
                    flex: 0.1.sh.toInt(),
                    child: Row(
                      children: [
                        // Expanded(
                        //   flex: 0.1.sw.toInt(),
                        //   child: TextButton(
                        //     child: Icon(
                        //       Icons.arrow_back_rounded,
                        //       color: Colors.white,
                        //     ),
                        //     onPressed: () {},
                        //   ),
                        // ),
                        Expanded(
                          flex: 0.2.sw.toInt(),
                          child: Padding(
                            padding: EdgeInsets.all(0.03.sw),
                            child: CircleAvatar(
                              radius: 0.1.sh,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0.7.sw.toInt(),
                          child: Text(
                            'Chat App',
                            style: TextStyle(
                              fontSize: 30.0,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 0.1.sw.toInt(),
                          child: TextButton(
                              child: Icon(
                                Icons.logout_rounded,
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
                ],
              ),
            ),
          ),
          Expanded(
            flex: 0.78.sh.toInt(),
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
                    child: realTimeMessageSync(),
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
                    flex: 0.85.sw.toInt(),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        //maxLines: 2,
                        onChanged: (value) {
                          //isSent = false;
                          message = value;
                        },
                        decoration: messageTextFieldDecoration,
                        style: messageContainerTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 0.15.sw.toInt(),
                    child: ElevatedButton(
                      onPressed: () async {
                        await sendMessage(message);
                        //isSent = true;
                      },
                      child: Icon(
                        Icons.send_rounded,
                        color: Color(0xee6A2C70),
                        size: 0.07.sw,
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        shadowColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
