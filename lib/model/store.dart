class Store {
  final int? id;
  final String? name;

  Store({this.id, this.name}); 

  factory Store.fromJson(Map<String, dynamic> item) {
    return Store(
        id: item["id"],
        name: item["name"],
        );
  }
}