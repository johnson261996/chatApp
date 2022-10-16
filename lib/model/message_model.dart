import '../util/utils.dart';

class MessageField {
  static String createdAt = "createdAt";
}

class Message {

  String idUser;
  String urlAvatar;
  String username;
  String message;
  DateTime createdAt;

  Message({required this.idUser,required this.urlAvatar,required this.username,required this.message,required this.createdAt});

  static Message fromJson(Map<String, dynamic> json) => Message(
      idUser: json['idUser'],
      username: json['userName'],
      message: json['message'],
      urlAvatar: json['urlAvatar'],
      createdAt: Utils.toDateTime(json['createdAt'])
    );


  Map<String, dynamic> toJson() => {
   'idUser': idUser,
   'userName': username,
   'urlAvatar': urlAvatar,
   'message':message,
   'createdAt': Utils.fromDateTimeToJson(createdAt)
  };


}