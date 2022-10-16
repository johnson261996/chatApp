

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../api/firebase_api.dart';
import '../model/user_model.dart';
import '../page/message_page.dart';

class ChatHeaderWidget extends StatefulWidget {
  final List<User>? users;
  const ChatHeaderWidget({required this.users,Key? key}) : super(key: key);

  @override
  State<ChatHeaderWidget> createState() => _ChatHeaderWidgetState();
}

class _ChatHeaderWidgetState extends State<ChatHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    int? len = widget.users?.length;
    int user_len = len! + 0;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Container(
             width: MediaQuery.of(context).size.width * 0.75,
               child: Text("ChatApp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color:Colors.white),)
           ),
          SizedBox(height: 15,),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
            Container(
              margin: EdgeInsets.only(right: 10),
              width: 45.0,
              height: 45.0,
              child: CircleAvatar(backgroundColor: Colors.red,radius: 10,child: Icon(Icons.search),),
            ),
              Expanded(
                child: Container(
                  height: 60,
                  child: ListView.builder(itemBuilder: (context, index) {
                    final user = widget.users;
                    print('index:$index');
                    print("firebase data:${user![index].urlAvatar.toString()}" );
                    return Container(
                      padding: EdgeInsets.only(right:10),
                      child: GestureDetector(
                        onTap:()async {
                          String u_doc_id= await FirebaseApi.getUserId(index);
                          print("users clicked:" + widget.users![index].name);
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                              MessagePage(users:widget.users![index].name,user_avatar:user[index].urlAvatar,userId:widget.users![index].idUser,user_doc_id:u_doc_id,u_list:widget.users)));
                        },
                        child: CircleAvatar(
                          radius: 24,
                          backgroundImage: NetworkImage(user![index].urlAvatar.isEmpty ?
                          'https://www.pinclipart.com/picdir/big/218-2189254_free-online-avatars-kid-characters-family-vector-for.png' :
                          user![index].urlAvatar),
                        ),
                      ),
                    );
                  },scrollDirection: Axis.horizontal,itemCount: user_len,shrinkWrap: true,),
                ),
              )
            ],
          ),

        ],
      ),
    );
  }
}
