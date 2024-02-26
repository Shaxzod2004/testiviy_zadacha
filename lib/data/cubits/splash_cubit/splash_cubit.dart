


import 'package:bloc/bloc.dart';
import 'package:testiviy_zadacha/data/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState>{

  SplashCubit():super(SplashInitialState());

  getLoding(){
    Future.delayed(Duration(seconds:5),(){
      emit(SplashLoadSuccessState());
    });
  }

}