part of 'items_cubit.dart';

@immutable
abstract class ItemsState {}

class ItemsInitial extends ItemsState {}
class ItemsLoadingState extends ItemsState {}
class ItemsLoadedState extends ItemsState {
  final List<ItemModel> items;
  ItemsLoadedState({required this.items});
}
class ItemsErrorState extends ItemsState {
  final String message;
  ItemsErrorState({required this.message});
}
