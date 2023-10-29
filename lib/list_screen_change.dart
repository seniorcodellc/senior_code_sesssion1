import 'dart:async';

import 'package:flutter/material.dart';
import 'package:senior_code_sesssion1/items_cubit/items_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreenChange extends StatefulWidget {
  const ListScreenChange({super.key});

  @override
  State<ListScreenChange> createState() => _ListScreenChangeState();
}

class _ListScreenChangeState extends State<ListScreenChange> {
  @override
  void initState() {
    context.read<ItemsCubit>().getItems();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<ItemsCubit, ItemsState>(
          listener: (context, state) {
            if (state is ItemsLoadedState) {
              showDialog(
                context: context,
                builder: (context) => const Dialog(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.dashboard, size: 200),
                      SizedBox(
                        height: 30,
                      ),
                      Text("data is Loaded", style: TextStyle(color: Colors.blueGrey, fontSize: 20)),
                      SizedBox(
                        height: 50,
                      ),
                    ],
                  ),
                ),
              );
              Timer(
                Duration(milliseconds: 2000),
                () => Navigator.pop(context),
              );
            }
          },
          builder: (context, state) {
            if (state is ItemsLoadedState && context.read<ItemsCubit>().items.isEmpty) {
              return const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                      child: Icon(
                    Icons.alarm,
                    size: 200,
                  )),
                  Text(
                    " no data",
                    style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                  )
                ],
              );
            } else if (state is ItemsErrorState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                      child: Icon(
                    Icons.error,
                    size: 200,
                  )),
                  Text(
                    state.message!,
                    style: TextStyle(color: Colors.blueGrey, fontSize: 50),
                  )
                ],
              );
            }
            return ListView.separated(
                itemBuilder: (context, index) {
                  if (state is ItemsLoadingState) {
                    return const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 150),
                      child: CircularProgressIndicator(
                        color: Colors.green,
                      ),
                    );
                  }
                  return Text(context.read<ItemsCubit>().items[index].title);
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 10,
                    ),
                itemCount: state is ItemsLoadingState ? 4 : context.read<ItemsCubit>().items.length);
          },
        ),
      ),
    );
  }
}
