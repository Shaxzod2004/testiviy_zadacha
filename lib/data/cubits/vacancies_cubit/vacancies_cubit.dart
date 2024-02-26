


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/models/vacancies_model.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';

part  'vacancies_state.dart';

class VacanciesCubit extends Cubit<VacanciesState>{

  VacanciesCubit(this.networkService):super(VacanciesState(status: Status.initial));

  NetworkService networkService;

  getVacancies(String category)async{
    emit(state.copyWith(status:Status.loading));

    VacanciesModel? vacanciesModel=await networkService.getVacanciesService(category);

    if(vacanciesModel!=null){
      emit(state.copyWith(status:Status.loaded,vacanciesModel:vacanciesModel));
    }
    else{
      emit(state.copyWith(status:Status.error));
    }


  }



}