

part of 'vacancies_cubit.dart';



class VacanciesState{

  final Status? status;
  final VacanciesModel? vacanciesModel;

  VacanciesState({this.status, this.vacanciesModel});


  VacanciesState copyWith({Status? status,VacanciesModel? vacanciesModel}){

    return VacanciesState(
        status: status ?? this.status,
        vacanciesModel: vacanciesModel ?? this.vacanciesModel
    );


  }


}