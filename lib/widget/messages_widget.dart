
import 'package:firebase_chat/api/firebase_api.dart';
import 'package:firebase_chat/model/message_model.dart';
import 'package:flutter/cupertino.dart';

import '../model/user_model.dart';
import 'chat_box_widget.dart';

class MessagesWidget extends StatefulWidget {
  String userId;
  String  user_avatar;
   MessagesWidget({Key? key, required this.userId,required this.user_avatar}) : super(key: key);

  @override
  State<MessagesWidget> createState() => _MessagesWidgetState();
}

class _MessagesWidgetState extends State<MessagesWidget> {
  @override
  Widget build(BuildContext context) =>
    StreamBuilder<List<Message>>(
     stream: FirebaseApi.getMessages(widget.userId),
     builder: (context,snapshot){
       final msg = snapshot.data;
       var m = msg;
       if(m!=null) {
         print("chat data:${m.length}");
         return m.isEmpty ? buildText("say hello"):
         ListView.builder(itemBuilder: (context,index){
           final message = m[index];
           //print("avatar:${widget.user_avatar}");
           print('Mesg_id:${message.idUser}\n' "userid:${widget.userId}");
           return ChatBoxWidget(message:message,userlist:widget.user_avatar,isMe:message.idUser == widget.userId);
         },physics: ClampingScrollPhysics(),itemCount:m.length,reverse: true, );
       }
       return Text("No data");
     }
    );


  Widget buildText(String text) =>Center(
    child: Text(
      text,
      style: TextStyle(fontSize: 24),
    ),
  );
}
