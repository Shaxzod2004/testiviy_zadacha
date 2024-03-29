

import 'package:testiviy_zadacha/data/models/user_model.dart';

class MessageModel {
  final UserModel user;
  final DateTime dateTime;
  final String text;


  MessageModel(this.user, this.dateTime, this.text);

  factory MessageModel.fromJson(Map<String, dynamic> data) {
    return MessageModel(
      UserModel.fromJson(data["user"]),
      data["dateTime"].toDate(),
      data["text"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "user": user.toJson(),
      "dateTime": dateTime,
      "text": text,
    };
  }
}