

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/cubits/user_cubit/user_cubit.dart';
import 'package:testiviy_zadacha/data/service/user_service.dart';

class RegisterPage extends StatelessWidget {
   RegisterPage({super.key});

  UserCubit userCubit=UserCubit(UserService());

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit,UserState>(
      builder: (context,state){
        return Scaffold(
            body:Stack(
              children: [
                Padding(
                  padding:EdgeInsets.only(left:20,right:20),
                  child: Center(
                    child:Column(
                      crossAxisAlignment:CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height:MediaQuery.of(context).size.height/8,
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width,
                          height:60,
                          child:TextField(
                            controller: userCubit.email,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText:'Email'
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/20,
                        ),
                        Container(
                          width:MediaQuery.of(context).size.width,
                          height:60,
                          child:TextField(
                            controller: userCubit.password,
                            decoration:InputDecoration(
                                border:OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                hintText:'Password'
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/5,
                        ),
                        MaterialButton(
                          onPressed:(){
                            userCubit.getRegister(context);
                          },
                          padding:EdgeInsets.zero,
                          shape:RoundedRectangleBorder(
                              borderRadius:BorderRadius.circular(10)
                          ),
                          child:Container(
                            width:200,
                            height:60,
                            decoration:BoxDecoration(
                                color: Colors.blue,
                                borderRadius:BorderRadius.circular(10)
                            ),
                            child:Center(child:Text('Register',style:TextStyle(color:Colors.white,fontSize:18),),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Container(
                  child: getBody(state,context),
                )
              ],
            )
        );
      },
    );
  }

   Widget? getBody(UserState state, BuildContext context) {

     if(state.status==Status.loading){
       return Center(child:CircularProgressIndicator(),);
     }
     if(state.status==Status.error){
       return Center(child:Text('ERROR'),);
     }

  }
}