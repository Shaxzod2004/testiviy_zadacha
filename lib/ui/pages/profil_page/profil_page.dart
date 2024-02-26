
import 'package:flutter/material.dart';
import 'package:testiviy_zadacha/data/hive/hive.dart';
import 'package:testiviy_zadacha/ui/pages/chat_page/chat_page.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/login_page/login_page.dart';
import 'package:testiviy_zadacha/ui/pages/profil_page/register_page/register_page.dart';

class ProfilPage extends StatelessWidget {
  ProfilPage({super.key,this.email});

  String? email;

  HiveRepository hiveRepository=HiveRepository();
  @override
  Widget build(BuildContext context) {
    String emailHive=hiveRepository.getEmail();
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor:Color(0xFFED7844),
        actions: [
          IconButton(onPressed:(){
           Navigator.push(context,MaterialPageRoute(builder:(context)=>ChatPage()));
          }, icon:Icon(Icons.chat_bubble_outline,size:40,color: Colors.white,))
        ],
      ),
            backgroundColor:emailHive==''?Colors.grey:Colors.white,
            body: emailHive==''?
            buildCenter(context):
            buildPadding(emailHive)
          );
  }

  Padding buildPadding(String emailHive) {
    return Padding(padding:EdgeInsets.only(left:20,top:40),
          child: Row(
            children: [
              Container(
                height:100,
                width:100,
                decoration:BoxDecoration(
                    shape:BoxShape.circle,
                    color: Colors.grey
                ),
                child:Icon(Icons.person,size:90,color: Colors.white,),
              ),

              SizedBox(
                width:20,
              ),

              Text('$emailHive')
            ],
          ),);
  }

  Center buildCenter(BuildContext context) {
    return Center(
            child: Container(
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
                            Navigator.pushReplacement(context, MaterialPageRoute(
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
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (context) => RegisterPage()));
                      }, child: Text('Royxatdan otish'))
                    ],
                  )
                ],
              ),

            ),
          );
  }

}