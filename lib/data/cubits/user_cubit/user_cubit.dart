



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/service/user_service.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/login_page/login_page.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/profil_page.dart';

part 'user_state.dart';
class UserCubit extends Cubit<UserState>{

  UserCubit(this.userService):super(UserState(status: Status.initial));


  initUser() async {
    userModel = FirebaseAuth.instance.currentUser;
  }
  UserService userService;

  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  var userModel=FirebaseAuth.instance.currentUser;

late  String? emailProfil='';
  getLogin(BuildContext context)async{
    emit(state.copyWith(status:Status.loading));
    UserCredential? userCredential=await userService.loginUser(email.text,password.text);
    if(userCredential!=null){
      emit(state.copyWith(status:Status.loaded));
      userModel= FirebaseAuth.instance.currentUser;
      userCredential.user;
      emailProfil=userModel?.email??"";
      print(emailProfil);
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>ProfilPage(email:emailProfil,)));
    }
    else{
      emit(state.copyWith(status:Status.error));
    }
  }


  getRegister(BuildContext context)async{
    emit(state.copyWith(status:Status.loading));
    UserCredential? userCredential=await userService.registerUser(email.text,password.text);
    print(state.status);
    if(userCredential!=null){
      emit(state.copyWith(status:Status.loaded));
      userModel= FirebaseAuth.instance.currentUser;
      userCredential.user;
      Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>LoginPage()));
      print(state.status);
    }
    else{
      print(state.status);
      emit(state.copyWith(status:Status.error));
    }


  }

}