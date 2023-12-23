import 'package:bloc_state_management/bloc/internet_bloc/internet_event.dart';
import 'package:bloc_state_management/bloc/internet_bloc/internet_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class InternetBloc extends Bloc<InternetEvent,InternetState>{
  InternetBloc() : super(InternetInitialState()){
    on<InternetLostEvent>((event, emit) =>emit(InternetLostState()) );
    on<InternetGainedEvent>((event, emit) => emit(InternetGainedState()));
  }

}