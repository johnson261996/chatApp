

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/user_model.dart';

class ProfileHeaderWidget extends StatefulWidget {
  String users;
   ProfileHeaderWidget({required this.users,Key? key}) : super(key: key);

  @override
  State<ProfileHeaderWidget> createState() => _ProfileHeaderWidgetState();
}

class _ProfileHeaderWidgetState extends State<ProfileHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return  AppBar(
      title: Text(
        widget.users,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
      ),
        leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          actions :[
            Container(
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff91CAF9),
                child: IconButton(
                  icon: Icon(Icons.call, color: Colors.white,size: 20,),
                  onPressed:null//Navigator.of(context).pop(),
                ),
              ),
            ),
            SizedBox(width: 10,),
            Container(
              child: const CircleAvatar(
                radius: 18,
                backgroundColor: Color(0xff91CAF9),
                child: IconButton(
                  icon: Icon(Icons.video_call, color: Colors.white),
                  onPressed: null //Navigator.of(context).pop(),
                ),
              ),
            ),
            SizedBox(width: 10,),
          ],
    );
  }
}
