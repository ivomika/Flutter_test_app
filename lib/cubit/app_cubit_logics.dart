import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_app/cubit/app_cubit_states.dart';
import 'package:test_app/cubit/app_cubits.dart';
import 'package:test_app/pages/detail_page.dart';
import 'package:test_app/pages/navPages/home_page.dart';
import 'package:test_app/pages/navPages/main_page.dart';
import 'package:test_app/pages/welcome_page.dart';
import 'package:test_app/widgets/app_large_text.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits, CubitStates>(
        builder: (context, state){
          if(state is WelcomeState){
            return const WelcomePage();
          }
          if(state is LoadingState){
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoadedState){
            return const MainPage();
          }
          if(state is DetailState){
            return const DetailPage();
          }
          else{
            return const Center(
              child: AppLargeText(text: '404',),
            );
          }
        }
      ),
    );
  }
}
