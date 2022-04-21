import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/cubit/app_cubit.states.dart';
import 'package:my_app/cubit/app_cubit_logics.dart';
import 'package:my_app/pages/detail_page.dart';
import 'package:my_app/pages/navpages/main_page.dart';
import 'package:my_app/pages/welcome.dart';
import 'package:my_app/services/data_services.dart';

import 'cubit/app_cubits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices()
        ),
        child: const AppCubitLogics(),
      )
    );
  }
}
