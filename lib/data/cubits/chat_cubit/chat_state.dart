

part of 'chat_cubit.dart';

class ChatState{

  final Status? status;

  ChatState({this.status,});


  ChatState copyWith({Status? status}){

    return ChatState(
        status: status ?? this.status,
    );


  }


}