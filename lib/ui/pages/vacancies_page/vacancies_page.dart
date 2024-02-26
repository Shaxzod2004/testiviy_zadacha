

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/cubits/vacancies_cubit/vacancies_cubit.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';
import 'package:testiviy_zadacha/ui/pages/datail_page/detail_page.dart';

class VacanciesPage extends StatelessWidget {
   VacanciesPage({super.key,this.category,this.name});


  VacanciesCubit vacanciesCubit=VacanciesCubit(NetworkService(Dio()));

  String? category;
  String? name;
  bool f=false;

  int id=0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>vacanciesCubit..getVacancies(category!),
    child: BlocBuilder<VacanciesCubit,VacanciesState>(
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            centerTitle:true,
            backgroundColor:Color(0xFFED7844),
            title: Text("$name",style:TextStyle(color: Colors.white),),
          ),
          body:getBody(state),
        );
      },
    ),);
  }

  getBody(VacanciesState state) {
    if(state.status==Status.loading){
      return Center(child:CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      var listVacancies =state.vacanciesModel?.data?.data;
      return ListView.builder(itemBuilder:(context,index){
        return Padding(padding:EdgeInsets.only(left:20,right:20,top:10,bottom:20),
          child:GestureDetector(
            onTap:(){
              id=listVacancies?[index].id??0;
              name=listVacancies?[index].companyName??"";
              print(name);
              Navigator.push(context,MaterialPageRoute(builder:(context)=>DetailPage(id:id,name: name,)));
              },
            child:Container(
              height:MediaQuery.of(context).size.height/3.5,
              width:MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.black12
              ),
              child:Padding(
                padding:EdgeInsets.only(left:20,top:25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("${listVacancies?[index].positionName}",style:TextStyle(fontSize:20),),
                    if(listVacancies?[index].salaryFrom != null) Text("${NumberFormat.decimalPattern().format(double.parse("${listVacancies?[index].salaryFrom}").toInt())} - ${NumberFormat.decimalPattern().format(double.parse("${listVacancies?[index].salaryTo}").toInt())}",style:TextStyle(fontSize:20),),
                    Text("${listVacancies?[index].companyName}",style:TextStyle(fontSize:15),),
                    Expanded(child: Text("${listVacancies?[index].regions?[0].nameUz}",style:TextStyle(fontSize:15),overflow:TextOverflow.ellipsis,maxLines:1,),)
                  ],
                ),
              )
            ),
          ),);
      },
        itemCount:listVacancies?.length,
      );
    }
    if(state.status==Status.error){
      return Center(child:Text('ERROR'),);
    }

  }


}
