

import 'package:firebase_chat/api/firebase_api.dart';
import 'package:firebase_chat/page/message_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class ChatBodyWidget extends StatefulWidget {
  List<User>? users;
   ChatBodyWidget({required this.users,Key? key}) : super(key: key);

  @override
  State<ChatBodyWidget> createState() => _ChatBodyWidgetState();
}

class _ChatBodyWidgetState extends State<ChatBodyWidget> {


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(topRight:Radius.circular(25),topLeft:Radius.circular(25) )
          ),
          child: buildChats(),
        )
    );
  }

  Widget buildChats() {
    return ListView.builder(itemBuilder: (context,index){
      final user_list = widget.users;

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 70,
            child: ListTile(
              onTap:()async{
                String u_doc_id= await FirebaseApi.getUserId(index);
              /*  print('userdocId:$u_doc_id');
                print("name:"+user_list[index].name);
                print("id:"+user_list[index].idUser);
                print("avatar:" + user_list[index].urlAvatar);*/
                Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                  MessagePage(users:user_list[index].name,user_avatar:user_list[index].urlAvatar,
                      userId:user_list[index].idUser,user_doc_id:u_doc_id,u_list:user_list)));
              },
              leading: CircleAvatar(
                radius: 25,
                backgroundColor: Colors.white24,
                backgroundImage: NetworkImage(user_list![index].urlAvatar),
              ),
              title: Text(user_list[index].name,style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal,color: Colors.black),),

            ),
          ),
          Divider(
              thickness: 0.5,
              color: Colors.grey
          )
        ],

      );
    },itemCount: widget.users!.length ,physics: BouncingScrollPhysics(),
    );
  }
}
