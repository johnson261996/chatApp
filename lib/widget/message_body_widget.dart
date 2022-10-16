

import 'package:firebase_chat/api/firebase_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';


class MessageBodyWidget extends StatefulWidget {
   String users;
   String user_docId;
   List<User>? uList;
   MessageBodyWidget({required this.users,required this.user_docId,required this.uList,Key? key}) : super(key: key);

  @override
  State<MessageBodyWidget> createState() => _MessageBodyWidgetState();
}

class _MessageBodyWidgetState extends State<MessageBodyWidget> {
  final _mesgController = TextEditingController();
   String message = '';
   bool btn_send = true;


  @override
  void initState() {
   validatePassword(message);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight:Radius.circular(25),topLeft:Radius.circular(25) )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: TextField(
              controller: _mesgController,
              textCapitalization: TextCapitalization.sentences,
              autocorrect: true,
              enableSuggestions: true,
              decoration:  InputDecoration(labelText: "Your Message",
              filled: true,fillColor: Colors.blueGrey[50],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  )
              ),
              onChanged: (value) {
                setState(() {
                  message = value;
                  validatePassword(message);
                });
              }
            ),
          ),
         SizedBox(width: 10,),
         if(btn_send)
           Container(
             padding: EdgeInsets.only(bottom: 7.0),
             child: CircleAvatar(
               radius: 25,
               backgroundColor: Colors.blue[500],
               child: IconButton(
                   color: Colors.white,
                   iconSize: 20,
                   icon: const Icon(Icons.send),
                   onPressed: () async{
                     // do something
                     FocusScope.of(context).unfocus();
                     //print("userid:${widget.users}" );
                     await FirebaseApi.UploadMessage(widget.users, message,widget.user_docId,widget.uList);
                     _mesgController.clear();
                   }
               ),
             ),
           )
         else
           Container(
             padding: EdgeInsets.only(bottom: 7.0),
             child: CircleAvatar(
               radius: 25,
               backgroundColor: Colors.blue[500],
               child: const IconButton(
                   color: Colors.white,
                   iconSize: 20,
                   icon: Icon(Icons.send),
                   onPressed: null
               ),
             ),
           )
        ],
      ),
    );
  }

  bool validatePassword(String value) {
    if (!value.isNotEmpty) {
      btn_send = false;
      return false;
    }
    btn_send = true;
    return true;
  }
}
