

import 'package:firebase_chat/api/firebase_api.dart';
import 'package:firebase_chat/model/user_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/chat_body_widget.dart';
import '../widget/chat_header_widget.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: StreamBuilder<List<User>>(
          stream: FirebaseApi.getUsers(),
          builder: (context,snapshot){

            switch(snapshot.connectionState){
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                return buildText('connected successfully');
              default:
                if(snapshot.hasError){
                  print("Firebase err:${snapshot.error}" );
                  return buildText('Something went wrong ');
                }else{
                  final users = snapshot.data;
                  if(snapshot.data!.isEmpty){
                    print("user data not found");
                  }
                  print("users:${users}");
                  return Column(
                    children: [
                      ChatHeaderWidget(users:users),
                      ChatBodyWidget(users:users),
                    ],
                  );
                }
            }
          },
        ),
      ),
    );
  }

  Widget buildText(String s) {
    return Center(child: Text(s,style: TextStyle(color: Colors.red,fontSize: 20),));
  }
}
