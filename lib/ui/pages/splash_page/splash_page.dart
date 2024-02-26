

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:svg_flutter/svg.dart';
import 'package:testiviy_zadacha/data/cubits/splash_cubit/splash_cubit.dart';
import 'package:testiviy_zadacha/data/cubits/splash_cubit/splash_state.dart';
import 'package:testiviy_zadacha/data/utils/app_svg.dart';
import 'package:testiviy_zadacha/ui/pages/catygoriya_page/catygoriya_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>SplashCubit()..getLoding(),
      child: BlocListener<SplashCubit,SplashState>(
        listener: (context, state) {
          if (state is SplashLoadSuccessState) {
            Navigator.pushReplacement(context,MaterialPageRoute(builder:(context)=>CatygoriyaPage()));
          }
        },
        child: Scaffold(
          body: Center(
            child:Center(child:SvgPicture.asset(AppSvg.splash,height:70,)),
          ),
        ),
      ),);
  }
}