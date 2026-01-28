import 'package:cloud_firestore/cloud_firestore.dart';
import '../domain/offer.dart';

class OffersRepository {
  final _db = FirebaseFirestore.instance;

  Future<List<Offer>> fetchOffers() async {
    final snap = await _db.collection('offers').get();
    return snap.docs
        .map((d) => Offer.fromMap(d.id, d.data()))
        .toList();
  }
}
