

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:testiviy_zadacha/data/hive/hive.dart';
import 'package:testiviy_zadacha/data/models/storage_model.dart';
import 'package:testiviy_zadacha/ui/pages/datail_page/detail_page.dart';

class FavoritePage extends StatelessWidget {
   FavoritePage({super.key});


  HiveRepository hiveRepository=HiveRepository();

  int id=0;
  @override
  Widget build(BuildContext context) {
    List list=hiveRepository.getFavorite();
    return Scaffold(
      body:ListView.builder(itemBuilder:(context,index){
        return Padding(padding:EdgeInsets.only(left:20,right:20,top:10,bottom:20),
          child:GestureDetector(
            onTap:(){
              id=StorageModel.fromJson(list[index]).id??0;
              print(id);
              Navigator.push(context,MaterialPageRoute(builder:(context)=>DetailPage(id:id)));
            },
            child:Container(
                height:MediaQuery.of(context).size.height/4,
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
                      Text("${StorageModel.fromJson(list[index]).positionName}",style:TextStyle(fontSize:20),), 
                      if(StorageModel.fromJson(list[index]).salaryFrom != null) Text("${NumberFormat.decimalPattern().format(double.parse("${StorageModel.fromJson(list[index]).salaryFrom}").toInt())} - ${NumberFormat.decimalPattern().format(double.parse("${StorageModel.fromJson(list[index]).salaryTo}").toInt())}",style:TextStyle(fontSize:20),),
                      Text("${StorageModel.fromJson(list[index]).companyName}",style:TextStyle(fontSize:15),),
                    //  Expanded(child: Text("${StorageModel.fromJson(list[index]).regions}",style:TextStyle(fontSize:15),overflow:TextOverflow.ellipsis,maxLines:1,),)
                    ],
                  ),
                )
            ),
          ),);
      },
      itemCount:list.length,
      ),
    );
  }
}
