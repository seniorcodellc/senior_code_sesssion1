import 'package:flutter/material.dart';
import 'package:senior_code_sesssion1/items_cubit/items_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  @override
  void initState() {
    context.read<ItemsCubit>().getItems();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<ItemsCubit, ItemsState>(
          buildWhen: (previous, current) => current is ItemsLoadingState || current is ItemsLoadedState,
          builder: (context, state) {
            if (state is ItemsLoadingState) {
              return ListView.separated(
                itemBuilder: (context, index) => const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 150),
                  child: CircularProgressIndicator(
                    color: Colors.green,
                  ),
                ),
                itemCount: 4,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              );
            }
            if (state is ItemsLoadedState ) {
              if(context.read<ItemsCubit>().items.isNotEmpty) {
                return ListView.separated(
                itemBuilder: (context, index) => Text(context.read<ItemsCubit>().items[index].title),
                itemCount: context.read<ItemsCubit>().items.length,
                separatorBuilder: (context, index) => const SizedBox(
                  height: 15,
                ),
              );
              } else{
                return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(child: Icon(Icons.alarm,size: 200,)),
                    Text(" no data",style: TextStyle(
                      color: Colors.blueGrey,fontSize: 50
                    ),)
                  ],
                );
              }
            }
            return Container();
          },
        ),
      ),
    );
  }
}
