import 'package:fidelity_app/model/store.dart';

class Cards {
  final int? id;
  final String? points;
  final Store? store;

  Cards({this.id, this.points, this.store});

  factory Cards.fromJson(Map<String, dynamic> item) {
    return Cards(
        id: item["id"],
        points: item["points"],
        store: Store.fromJson(item["store"]),
        );
  }
}