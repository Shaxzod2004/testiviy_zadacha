

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testiviy_zadacha/data/cubits/chat_cubit/chat_cubit.dart';
import 'package:testiviy_zadacha/data/models/message_model.dart';
import 'package:testiviy_zadacha/data/service/chat_service.dart';

class ChatPage extends StatelessWidget {
   ChatPage({super.key});

  ChatCubit chatCubit=ChatCubit(MessagesService());
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>chatCubit..initUser(),
    child: BlocBuilder<ChatCubit,ChatState>(
      builder: (context,state){
        return Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
            backgroundColor:Color(0xFFED7844),
            title:Text('Chat'),
          ),
          body:Stack(
            children: [

              Center(
                child:Column(
                  children: [
                    Expanded(child: buildBody(state)),
                    Container(
                      color:Colors.white,
                      child: TextField(
                        controller:chatCubit.textEditingController,
                        decoration: InputDecoration(
                            suffixIcon:IconButton(onPressed: (){
                              chatCubit.addMessage();
                              print(chatCubit.userModel?.email);
                            },icon: Icon(Icons.send,),)
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        );
      },
    ),);
  }

  buildBody(ChatState state) {
   return StreamBuilder(stream:chatCubit.getAllMessages(),
       builder:(BuildContext context, AsyncSnapshot<QuerySnapshot<MessageModel>> snapshot){
         if (snapshot.connectionState == ConnectionState.active) {
           var data=snapshot.data?.docs;
           data?.sort((a,b){return a.data().dateTime.compareTo(b.data().dateTime);
           });

           return ListView.builder(
               itemCount: data?.length ?? 0,
               itemBuilder:(context, index){
                 var message = data![index].data();
                 return Padding(padding:EdgeInsets.only(top: 10,left: 10,right: 10),
                   child: Container(
                     alignment:
                     message.user.email == chatCubit.userModel?.email
                         ? Alignment.centerRight
                         : Alignment.centerLeft,

                     child:Container(
                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                         color: Color(0xFF313131),),
                       child:Padding(
                         padding: EdgeInsets.all(5),
                         child: Column(
                           children: [
                             Text(message.user.email ?? "",style: TextStyle(fontSize:20,color: Colors.white),),
                             Text(message.text ?? "",style: TextStyle(fontSize:20,color: Colors.white)),
                             // Text(message.dateTime. ?? "",style: TextStyle(fontSize:20)),
                           ],
                         ),
                       ),),
                   ),);
               });

         }
         return CircularProgressIndicator();
       }

   );
  }



}
