




part of 'catygoriya_cubit.dart';


class CatygoriyaState{

  final Status? status;
  final CatygoriyaModel? catygoriyaModel;

  CatygoriyaState({this.status, this.catygoriyaModel});


  CatygoriyaState copyWith({Status? status,CatygoriyaModel? catygoriyaModel}){

    return CatygoriyaState(
    status: status ?? this.status,
    catygoriyaModel: catygoriyaModel ?? this.catygoriyaModel
    );


  }


}