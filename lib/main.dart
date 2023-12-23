import 'package:bloc_state_management/bloc/internet_bloc/internet_bloc.dart';
import 'package:bloc_state_management/screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InternetBloc(),
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}


