import 'package:my_app/pages/detail_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/welcome.dart';

import 'app_cubits.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit.states.dart';

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
        builder: (BuildContext context, state) {
          if(state is WelcomeState) {
            return Welcome();
          }if(state is LoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }if(state is LoadedState) {
            return HomePage();
          }if(state is DetailState) {
            return DetailPage();
          }else {
            return Container();
          }
        },
      ),
    );
  }
}
