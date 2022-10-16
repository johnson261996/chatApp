import 'package:intl/intl.dart';
import 'package:firebase_chat/util/utils.dart';

class User {

  final String idUser;
  final String name;
  final String urlAvatar;
  final DateTime lastmsgTime;


  User({required this.idUser,required this.name, required this.urlAvatar, required this.lastmsgTime});

  User CopyWith({  String? idUser,
     String? name,
     String? urlAvatar,
     DateTime? lastmsgTime,
  }) =>
      User(idUser:idUser ?? this.idUser,
          name: name ?? this.name,
          urlAvatar: urlAvatar ?? this.urlAvatar,
          lastmsgTime: lastmsgTime ?? this.lastmsgTime
      );

  static User fromJson(Map<String, dynamic> json) {
    return User(
      idUser: json['idUser'],
      name: json['name'],
      urlAvatar: json['urlAvatar'],
      lastmsgTime: Utils.toDateTime(json['lastmsgTime'])
    );
  }

  Map<String, dynamic> toJson() => {
      'idUser': idUser,
      'name': name,
      'urlAvatar': urlAvatar,
      'lastmsgTime': Utils.fromDateTimeToJson(lastmsgTime)
  };

}

class UserField {
   late String lastmsg= 'lastmsgTime';
}

