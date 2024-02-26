


import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:testiviy_zadacha/data/models/catygoriya_model.dart';
import 'package:testiviy_zadacha/data/models/detail_model.dart';
import 'package:testiviy_zadacha/data/models/vacancies_model.dart';

part 'network_service.g.dart';

@RestApi(baseUrl: 'https://ish.uz/api/api/v1')
abstract class NetworkService {
  factory NetworkService(Dio dio, {String baseUrl}) = _NetworkService;

  @GET('/categories-with-vacancies')
  Future<CatygoriyaModel?> getCatygoriyaService(
      );

  @GET('/vacancies')
  Future<VacanciesModel?> getVacanciesService(
      @Query('category')  String category
      );

  @GET('/vacancies/{id}')
  Future<DetailModel?> getDetailService(
      @Path('id')  int id
      );




}