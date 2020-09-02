//for click listner

import 'package:bloc/bloc.dart';
import 'package:eHomeService/authentiction/login.dart';
import 'package:flutter/cupertino.dart';

enum NavigationEvents{
 HomePageClickedEvent,
 LoginPageClickedEvent,
 RegisterPageClickedEvent,
 SplashClickedEvent
}
abstract class NavigationStates{}
class NavigationBloc extends Bloc<NavigationEvents , NavigationStates>{
  @override
  // TODO: implement initialState
  NavigationStates get initialState => LoginPage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    // TODO: implement mapEventToState
    switch(event){
      // case NavigationEvents.HomePageClickedEvent:yield HomePage();
      // break;
      case NavigationEvents.LoginPageClickedEvent:yield LoginPage();
      break;

      // case NavigationEvents.RegisterPageClickedEvent:yield RegisterPage();
      // break;
      // case NavigationEvents.SplashClickedEvent:yield splashPage();
      // break;
    }
  }
}