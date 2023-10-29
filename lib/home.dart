import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_cubit/counter_cubit.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int ntimes = 0;
  double height = 0;
  double width = 0;
  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    ntimes++;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "build times $ntimes",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                buildWhen: (previous, current) {
                  return current is CounterIncreaseChanged;
                },
                builder: (context, state) {
                  debugPrint("${state.runtimeType}");
                  return Text(
                    "count is ${context.read<CounterCubit>().counter}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,

                      fontSize: 30,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 30,
              ),
              BlocBuilder<CounterCubit, CounterState>(
                buildWhen: (previous, current) {
                  return current is CounterDecreaseChanged;
                },
                builder: (context, state) {
                  debugPrint("${state.runtimeType}");
                  return Text(
                    "count is ${context.read<CounterCubit>().counter}",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  );
                },
              ),
              SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().increase();

                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                    child: const Text("+"),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: width * 0.3,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterCubit>().decrease();
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrangeAccent),
                    child: Text("-"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
