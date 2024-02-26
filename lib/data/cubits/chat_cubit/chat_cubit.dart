


import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/models/message_model.dart';
import 'package:testiviy_zadacha/data/models/user_model.dart';
import 'package:testiviy_zadacha/data/service/chat_service.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState>{
  ChatCubit(this.messagesService):super(ChatState(status: Status.initial));


  TextEditingController textEditingController=TextEditingController();
  MessagesService messagesService;
  var userModel=FirebaseAuth.instance.currentUser;

  initUser() async {
    userModel = FirebaseAuth.instance.currentUser;
  }


  addMessage()async{
    messagesService.addMessages(MessageModel(
        UserModel(email:FirebaseAuth.instance.currentUser?.email),
        DateTime.now(),
        textEditingController.text,
    ));
    textEditingController.text='';
  }

  Stream<QuerySnapshot<MessageModel>> getAllMessages() {
    return messagesService.getAllMessages();
  }

}