
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';
import '../widget/message_body_widget.dart';
import '../widget/messages_widget.dart';
import '../widget/profile_header_widget.dart';

class MessagePage extends StatefulWidget {
  String users;
  String userId;
  String user_doc_id;
  String user_avatar;
  List<User>? u_list;

   MessagePage({required this.users,required this.user_avatar,required this.userId,required this.u_list, required this.user_doc_id,Key? key} ) : super(key: key);

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeaderWidget(users:widget.users),
            Expanded(child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25.0),
                  topRight:  Radius.circular(25.0),
                )
              ),
              child: MessagesWidget(userId:widget.userId,user_avatar:widget.user_avatar),
            )),
            MessageBodyWidget(users:widget.userId,user_docId:widget.user_doc_id,uList:widget.u_list)
          ],
        ),
      ),
    );
  }
}
