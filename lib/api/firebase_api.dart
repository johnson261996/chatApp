
import 'package:firebase_chat/util/utils.dart';

import '../model/message_model.dart';
import '../model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseApi {

  static UserField user = UserField();

  static Stream<List<User>> getUsers() {
   return FirebaseFirestore.instance.collection('users')
    .orderBy(user.lastmsg,descending: true)
    .snapshots().transform(Utils.transformer((User.fromJson)));
  }

  static Future<String> getUserId(int index) async{
    var collection = FirebaseFirestore.instance.collection('users');
    var querySnapshots = await collection.get();
    String id =  querySnapshots.docs[index].id;
    return id;
  }

  static UploadMessage(String user_id,String msg,String user_doc_id,List<User>? uList)async{
    final refmessage = FirebaseFirestore.instance.collection('chats/$user_id/messages');
    final newMessage = Message(idUser: user_id, urlAvatar: uList![int.parse(user_id)].urlAvatar,
        username: uList![int.parse(user_id)].name, message: msg, createdAt: DateTime.now());
    //add the message
    await refmessage.add(newMessage.toJson());
    //update the latest user who sent the message
    final refUsers = FirebaseFirestore.instance.collection('users');
    await refUsers.doc(user_doc_id).update({user.lastmsg:DateTime.now()});
  }

  static Stream<List<Message>> getMessages(String idUser){
    return FirebaseFirestore.instance.collection('chats/$idUser/messages')
        .orderBy(MessageField.createdAt,descending: true)
        .snapshots().transform(Utils.transformer((Message.fromJson)));
  }

}