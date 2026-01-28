import 'package:cloud_firestore/cloud_firestore.dart';
import 'store_model.dart';

class StoreService {
  final _db = FirebaseFirestore.instance;

  Stream<List<Store>> getStores() {
    return _db.collection('stores').snapshots().map(
          (s) => s.docs.map((d) => Store.fromMap(d.id, d.data())).toList(),
        );
  }
}
