


import 'package:bloc/bloc.dart';
import 'package:testiviy_zadacha/data/models/catygoriya_model.dart';
import 'package:testiviy_zadacha/data/models/detail_model.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';

part 'catygoriya_state.dart';


enum Status { initial,loading, loaded, error}

class CatygoriyaCubit extends Cubit<CatygoriyaState>{

  CatygoriyaCubit(this.networkService):super(CatygoriyaState(status: Status.initial));

  NetworkService networkService;
  
  getCatygoriya()async{
    emit(state.copyWith(status:Status.loading));

    CatygoriyaModel? catygoriyaModel=await networkService.getCatygoriyaService();

    if(catygoriyaModel!=null){
      emit(state.copyWith(status:Status.loaded,catygoriyaModel: catygoriyaModel));
    }
    else{
      emit(state.copyWith(status:Status.error));
    }


  }



}