
import 'package:firebase_chat/model/message_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:timeago/timeago.dart' as timeago;

class ChatBoxWidget extends StatefulWidget {
  final Message message;
  final bool isMe;
  final String userlist;
  const ChatBoxWidget({Key? key, required this.message,required this.userlist, required this.isMe}) : super(key: key);

  @override
  State<ChatBoxWidget> createState() => _ChatBoxWidgetState();
}

class _ChatBoxWidgetState extends State<ChatBoxWidget> {
  @override
  Widget build(BuildContext context) {
    final br = const BorderRadius.all(Radius.circular(12.0));
    print("isme:${widget.isMe}");
    return Row(
      mainAxisAlignment: widget.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if(!widget.isMe)
          CircleAvatar(
            radius:15,
            backgroundImage: NetworkImage(widget.userlist),
          ),
        Container(
          padding: EdgeInsets.all(16.0),
          margin: EdgeInsets.all(16.0),
          constraints: BoxConstraints(
            maxWidth: 145
          ),
          decoration: BoxDecoration(
            color: widget.isMe ? Colors.grey[500] : Colors.deepOrange,
            borderRadius: widget.isMe ? br.subtract(BorderRadius.only(bottomRight: Radius.circular(12.0))) :
            br.subtract(BorderRadius.only(bottomLeft: Radius.circular(12.0))
          ),
        ),
          child: buildMsg(widget.message),
        ),
      ],
    );
  }

  Widget buildMsg(Message msg) =>Column(
    crossAxisAlignment: widget.isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
    children: [
      Text(
        msg.message,
        style: TextStyle(fontSize: 15,),
        textAlign: widget.isMe ? TextAlign.end : TextAlign.start,
      ),
      Text(timeago.format(msg.createdAt, locale: 'en_short'),
        style: TextStyle(fontSize: 7,color: Colors.white),textAlign: widget.isMe ? TextAlign.end : TextAlign.start,)
    ],
  );
}
