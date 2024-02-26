

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:intl/intl.dart';
import 'package:testiviy_zadacha/data/cubits/catygoriya_cubit/catygoriya_cubit.dart';
import 'package:testiviy_zadacha/data/cubits/detail_cubit/detail_cubit.dart';
import 'package:testiviy_zadacha/data/hive/hive.dart';
import 'package:testiviy_zadacha/data/models/storage_model.dart';
import 'package:testiviy_zadacha/data/service/network_service.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/login_page/login_page.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/register_page/register_page.dart';

class DetailPage extends StatelessWidget {
   DetailPage({super.key,this.id,this.name});



   int? id;
   String? name;
   HiveRepository hiveRepository=HiveRepository();


   late bool select;
  DetailCubit detailCubit=DetailCubit(NetworkService(Dio()));
  @override
  Widget build(BuildContext context) {
    //List list=hiveRepository.getFavorite();
    String email=hiveRepository.getEmail();
    return BlocProvider(create: (context)=>detailCubit..getDetail(id!),
    child: BlocBuilder<DetailCubit,DetailState>(
      builder: (context,state){
        return Scaffold(
          appBar:AppBar(
            iconTheme: IconThemeData(color: Colors.white),
            backgroundColor:Color(0xFFED7844),
            actions: [
              IconButton(onPressed:(){

                 detailCubit.favorite(state.select??false);

                StorageModel storageModel=StorageModel(
                id: id,
                positionName: state.detailModel?.data?.positionName,
                salaryFrom: state.detailModel?.data?.salaryFrom,
                salaryTo: state.detailModel?.data?.salaryTo,
                companyName: state.detailModel?.data?.companyName,
                regions:state.detailModel?.data?.regions?[0].nameUz,
              );
                hiveRepository.saveFavorite(<Map<String,dynamic>>[storageModel.toJson()]);


              },icon:Icon((state.select ?? false)
                  ? Icons.favorite
                  : Icons.favorite_border_rounded,size:35,color:(state.select ?? false)?Colors.red:Colors.white,),
              )

            ],
          ),
          body: getBody(state,context,email),
        );
      },
    ),);
  }

 /* Widget html=Html(
    data: '',
  );*/


  getBody(DetailState state, BuildContext context, String email) {
  if(state.status==Status.loading){
    return Center(child:CircularProgressIndicator(),);
  }

  if(state.status==Status.loaded){
    bool select=hiveRepository.getFollow();
    var detailState=state.detailModel?.data;

    return Container(
      padding: EdgeInsets.only(left:20),
      child:Column(
        children: [
          Expanded(child:ListView(
            children: [
              SizedBox(
                height:40,
              ),
              Text("Elon qilingan:${detailState?.createdAt}",style:TextStyle(fontSize:17,color:Colors.grey),),
              SizedBox(
                height:10,
              ),
              Text("${detailState?.positionName}",style:TextStyle(fontSize:25,color:Colors.blueAccent),),
              if(detailState?.salaryFrom != null) Row(
                children: [
                  Icon(Icons.account_balance_wallet_outlined,color:Color(0xFFED7844),size:30,),
                  SizedBox(
                    width:MediaQuery.of(context).size.width/80,
                  ),
                  Text("${NumberFormat.decimalPattern().format(double.parse("${detailState?.salaryFrom}").toInt())} - ${NumberFormat.decimalPattern().format(double.parse("${detailState?.salaryTo}").toInt())}",style:TextStyle(fontSize:20),),
                ],
              ),
              SizedBox(
                height:10,
              ),
              Row(
                children: [
                  Icon(Icons.card_travel_rounded,color:Color(0xFFED7844),size:30,),
                  SizedBox(
                    width:MediaQuery.of(context).size.width/80,
                  ),
                  Expanded(child: Text('${detailState?.companyName}'))
                ],
              ),
              SizedBox(
                height:10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(Icons.location_on_outlined,color:Color(0xFFED7844),size:30,),
                  SizedBox(
                    width:MediaQuery.of(context).size.width/80,
                  ),
                  Expanded(child:Text('${detailState?.regions?[0].nameUz??""},${detailState?.district?.nameUz??""}\n${detailState?.address??""}',)
                  )
                ],
              ),

              Container(
                child: Html(
                  data: "${detailState?.vacancyDetail}",
                ),

              )
            ],
          )),
          Align(alignment: Alignment.bottomCenter,
              child:Container(
                height:80,
                width:MediaQuery.of(context).size.width,
                color: Colors.white,
                child: Padding(
                  padding:EdgeInsets.only(left:20,right:20,bottom:20,top:5),
                  child:Container(
                    height:MediaQuery.of(context).size.height/14,
                    width:MediaQuery.of(context).size.width,
                    decoration:BoxDecoration(
                        color:select?Color(0xFFED7844):Colors.white,
                        borderRadius:BorderRadius.circular(10),
                      border: Border.all(width:2,color:Color(0xFFED7844),)
                    ),
                    child:MaterialButton(
                      shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      onPressed: (){
                      if(email==''){
                       show(context);
                      }else{
                        if(state.detailModel?.data?.id==id){
                        detailCubit.followSelect(state.follow??false);
                        detailCubit.hiveDetail(state.follow??false);
                         print(select);}
                        //Navigator.push(context,MaterialPageRoute(builder:(context)=>ProfilPage()));
                      }

                      },
                      child:Center(child:select?Text('Taklif yuborish',style:TextStyle(color:Colors.white,fontSize:20),):Text('Taklif yuborildi',style:TextStyle(color:select?Colors.white:Color(0xFFED7844),fontSize:20),)),
                    ),
                  ),
                ),
              )
          )
        ],
      ),
    );
  }

  if(state.status==Status.error){
    return Center(child:Text('ERROR'),);
  }


  }

  Future<dynamic> show(BuildContext context,) {
    return showDialog(context: context,
                         builder:(context){
                       return Dialog(
                         child:Container(
                           height: 300,
                           width: 300,
                           decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(10),
                               color: Colors.white
                           ),
                           child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 height: 80,
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width,
                                 color: Colors.white,
                                 child: Padding(
                                   padding: EdgeInsets.only(
                                       left: 20, right: 20, bottom: 20, top: 5),
                                   child: Container(
                                     height: MediaQuery
                                         .of(context)
                                         .size
                                         .height / 14,
                                     width: MediaQuery
                                         .of(context)
                                         .size
                                         .width,
                                     decoration: BoxDecoration(
                                         color: Color(0xFFED7844),
                                         borderRadius: BorderRadius.circular(10)
                                     ),
                                     child: MaterialButton(
                                       shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(10)),
                                       onPressed: () {
                                         Navigator.push(context, MaterialPageRoute(
                                             builder: (context) => LoginPage()));
                                       },
                                       child: Center(child: Text('Kirish'),),
                                     ),
                                   ),
                                 ),
                               ),

                               Row(
                                 mainAxisAlignment: MainAxisAlignment.center,
                                 children: [
                                   Text('Profilingiz yoqmi?'),
                                   TextButton(onPressed: () {
                                     Navigator.push(context, MaterialPageRoute(
                                         builder: (context) => RegisterPage()));
                                   }, child: Text('Royxatdan otish'))
                                 ],
                               )
                             ],
                           ),

                         ),
                       );
                         });
  }


}