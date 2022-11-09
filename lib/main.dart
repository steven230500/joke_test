import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_joke/src/bloc/joke_bloc.dart';
import 'package:prueba_joke/src/pages/home.dart';
import 'package:prueba_joke/src/repository/repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final routes = {'/': (_) => const HomePage()};
    return BlocProvider(
      create: (context) => JokeBloc(Respository())..add(const LoadJokeEvent()),
      child: MaterialApp(
        initialRoute: '/',
        routes: routes,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
      ),
    );
  }
}
