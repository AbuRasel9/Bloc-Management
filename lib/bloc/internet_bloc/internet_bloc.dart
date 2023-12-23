import 'dart:async';

import 'package:bloc_state_management/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_state_management/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity/connectivity.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  Connectivity _connectivity=Connectivity();
  StreamSubscription ? connectivitySubscription;

  InternetBloc() : super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) =>emit(InternetLostState()) );
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));

    //check mobile connected internet or not
    connectivitySubscription=_connectivity.onConnectivityChanged.listen((result) {
      if(result==ConnectivityResult.mobile || result==ConnectivityResult.wifi){
        add(InternetGainedEvent());
      }
      else{
        add(InternetLostEvent());
      }

    });
  }
  @override
  Future<void> close() {
    // connectivitySubscription?.cancel();
    return super.close();
  }

}