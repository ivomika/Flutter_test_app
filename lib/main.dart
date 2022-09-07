import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/app_cubit_logics.dart';
import 'package:test_app/cubit/app_cubits.dart';
import 'package:test_app/pages/detail_page.dart';
import 'package:test_app/pages/navPages/main_page.dart';
import 'package:test_app/pages/welcome_page.dart';
import 'package:test_app/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flitter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataService()
        ),
        child: const AppCubitLogics(),
      ),
    );
  }
}


