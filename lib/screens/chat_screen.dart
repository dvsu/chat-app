import 'package:flutter/material.dart';
import 'package:chat_app/theme/textstyling.dart';
import 'package:chat_app/theme/decoration.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data =
                  document.data() as Map<String, dynamic>;
              return ListTile(
                title: Text(data['sender']),
                subtitle: Text(data['text']),
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
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('Chat App'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 0.9.sh.toInt(),
              child: realTimeMessageSync(),
            ),
            Expanded(
              flex: 0.1.sh.toInt(),
              child: Container(
                decoration: messageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
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
                    ElevatedButton(
                      onPressed: () async {
                        await sendMessage(message);
                        //isSent = true;
                      },
                      child: Text(
                        'Send',
                        style: sendButtonTextStyle,
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
  }
}
