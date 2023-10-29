import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../data/model/item_model.dart';

part 'items_state.dart';

class ItemsCubit extends Cubit<ItemsState> {
  ItemsCubit() : super(ItemsInitial());
  List<ItemModel> items=[];
  getItems() async {
    emit(ItemsLoadingState());
    List<ItemModel> items = await getItemsFromServer();
    this.items=items;
    emit(ItemsLoadedState(items: items));
    //emit(ItemsErrorState(message: "Server Error"));
  }
}
