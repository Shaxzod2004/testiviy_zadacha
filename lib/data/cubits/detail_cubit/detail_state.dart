



part of 'detail_cubit.dart';


class DetailState{

  final Status? status;
  final DetailModel? detailModel;
  final bool? select;
  final bool? follow;

  DetailState({this.status, this.detailModel,this.select,this.follow});


  DetailState copyWith({Status? status,DetailModel? detailModel,bool? select,bool? follow}){

    return DetailState(
        status: status ?? this.status,
        detailModel: detailModel ?? this.detailModel,
        select: select ?? this.select,
        follow: follow ?? this.follow
    );


  }


}