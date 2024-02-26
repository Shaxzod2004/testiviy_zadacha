


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:testiviy_zadacha/data/models/message_model.dart';

class MessagesService{

  late CollectionReference<MessageModel> collectionReference;

  MessagesService(){
    collectionReference=FirebaseFirestore.instance
        .collection("message")
        .withConverter(fromFirestore:(snapshot,_)=>MessageModel.fromJson(snapshot.data()!),
        toFirestore:(a,_)=>a.toJson());
  }

  Future addMessages(MessageModel messageModel)async{
    var respons=await collectionReference.add(messageModel);
  }



  Stream<QuerySnapshot<MessageModel>> getAllMessages(){
    return collectionReference.snapshots();
  }






}