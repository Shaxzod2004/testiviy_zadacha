


import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:svg_flutter/svg_flutter.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';
import 'package:testiviy_zadacha/data/utils/app_svg.dart';
import 'package:testiviy_zadacha/ui/pages/favorite_page/favorite_page.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/profil_page.dart';
import 'package:testiviy_zadacha/ui/pages/vacancies_page/vacancies_page.dart';

class CatygoriyaPage extends StatelessWidget {
   CatygoriyaPage({super.key});

  CatygoriyaCubit catygoriyaCubit=CatygoriyaCubit(NetworkService(Dio()));

  String catygory='';
   String? name='';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context)=>catygoriyaCubit..getCatygoriya(),
    child: BlocBuilder<CatygoriyaCubit,CatygoriyaState>(
      builder: (context,state){
        return Scaffold(
          appBar:AppBar(
            iconTheme: IconThemeData(color: Colors.white),
           backgroundColor:Color(0xFFED7844),
            actions: [
              Padding(padding:EdgeInsets.only(right:20),
              child: SvgPicture.asset(AppSvg.splash,height:40,),)
            ],
          ),
          drawer: Drawer(
            child: Padding(
              padding: EdgeInsets.only(left:20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                  height: MediaQuery.of(context).size.height/10,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>ProfilPage()));
                    },
                    child:Row(
                      children: [
                        Icon(Icons.person,size:40,color:Color(0xFFED7844),),
                        SizedBox(
                          width:10,
                        ),
                        Text('Profil',style:TextStyle(fontSize:17),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/50,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder:(context)=>FavoritePage()));
                    },
                    child:Row(
                      children: [
                        Icon(Icons.favorite_border_rounded,size:40,color:Color(0xFFED7844),),
                        SizedBox(
                          width:10,
                        ),
                        Text('Sevimli',style:TextStyle(fontSize:17),)
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height/50,
                  ),
                  GestureDetector(
                    onTap: (){
                      showDatePicker(
                        context: context,
                        initialDate:DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2030),
                      );
                    },
                    child:Row(
                      children: [
                        Icon(Icons.calendar_today_outlined,size:40,color:Color(0xFFED7844),),
                        SizedBox(
                          width:10,
                        ),
                        Text('Kalendar',style:TextStyle(fontSize:17),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          body:getBody(state),
        );
      },
    ),);
  }

  getBody(CatygoriyaState state) {
    if(state.status==Status.loading){
      return Center(child:CircularProgressIndicator(),);
    }
    if(state.status==Status.loaded){
      var list=state.catygoriyaModel?.data;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:EdgeInsets.only(left:20,top:20,bottom:10),
            child: Text('Категориялар бўйича вакансиялар',style:TextStyle(fontSize:20),),
          ),
         Expanded(child:  ListView.builder(itemBuilder:(context,index){
           return Padding(padding:EdgeInsets.only(left:20,top:10),
             child:GestureDetector(
               onTap:(){
                 catygory=list?[index].slug??"";
                 name=list?[index].nameUz??"";
                 print(catygory);
                 Navigator.push(context,MaterialPageRoute(builder:(context)=>VacanciesPage(category:catygory,name: name,)));

               },
               child:Container(
                 height:60,
                 child:Text("${list?[index].nameOz} (${list?[index].count})",style:TextStyle(color: Colors.blueAccent,fontSize:18),),
               ),
             ),);
         },
           itemCount:list?.length,
         ))
        ],
      );
    }
    if(state.status==Status.error){
      return Center(child:Text('ERROR'),);
    }
  }

}