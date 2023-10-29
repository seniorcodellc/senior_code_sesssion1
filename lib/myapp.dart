import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:senior_code_sesssion1/counter_cubit/counter_cubit.dart';
import 'package:senior_code_sesssion1/items_cubit/items_cubit.dart';
import 'package:senior_code_sesssion1/list_screen.dart';
import 'home.dart';
import 'list_screen_change.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<CounterCubit>(
            create: (context) => CounterCubit(),
          ),
          BlocProvider<ItemsCubit>(
            create: (context) => ItemsCubit(),
          ),
        ],
        child: const MaterialApp(
          title: 'Flutter session 1',
          home: ListScreenChange(),
        ));
  }
}
