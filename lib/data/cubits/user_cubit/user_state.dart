


part of 'user_cubit.dart';


class UserState{

  final Status? status;
  final User? user;

  UserState({this.status,this.user});


  UserState copyWith({Status? status,User? user}){

    return UserState(
        status: status ?? this.status,
        user: user ?? this.user
    );


  }


}