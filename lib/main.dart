import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:testiviy_zadacha/data/cubits/user_cubit/user_cubit.dart';
import 'package:testiviy_zadacha/data/service/user_service.dart';
import 'package:testiviy_zadacha/ui/pages/splash_page/splash_page.dart';

import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('favorite');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}


/*

https://ish.uz/api/api/v1/categories-with-vacancies katygoriya
https://ish.uz/api/api/v1/vacancies?category=it detail
https://ish.uz/api/api/v1/vacancies/2734 detail

*/

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers:[
      BlocProvider(create:(context)=>UserCubit(UserService()))
    ], child:MaterialApp(
        debugShowCheckedModeBanner:false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:SplashPage()
    ));
  }
}

