

import 'package:bloc/bloc.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/hive/hive.dart';
import 'package:testiviy_zadacha/data/models/detail_model.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';

part 'detail_state.dart';

class DetailCubit extends Cubit<DetailState>{

  DetailCubit(this.networkService):super(DetailState(status: Status.initial,select:false,follow:true));

  NetworkService networkService;

  getDetail(int id)async{
    emit(state.copyWith(status:Status.loading));

    DetailModel? detailModel=await networkService.getDetailService(id);

    if(detailModel!=null){
      emit(state.copyWith(status:Status.loaded,detailModel: detailModel));
    }
    else{
      emit(state.copyWith(status:Status.error));
    }


  }


  favorite(bool select){
    emit(state.copyWith(select:!select));
  }

  HiveRepository hiveRepository=HiveRepository();
  followSelect(bool follow){
    emit(state.copyWith(follow:!follow));
  }

  hiveDetail(bool a){
    hiveRepository.saveFollow(a);
  }


}