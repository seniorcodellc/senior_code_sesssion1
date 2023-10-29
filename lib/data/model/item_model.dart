class ItemModel{
  String title;
  ItemModel({required this.title});

}
Future<List<ItemModel>> getItemsFromServer(){
  List<ItemModel> items=[
    ItemModel(title: "ahmed"),
    ItemModel(title: "amira"),
    ItemModel(title: "yousef"),
    ItemModel(title: "donia"),
    ItemModel(title: "aya"),
  ];
  return Future.delayed(const Duration(milliseconds: 5000),() => items,);
}