import '../models/admin_offer.dart';

class AdminOfferService {
  static final List<AdminOffer> _offers = [];

  static List<AdminOffer> get activeOffers =>
      _offers.where((o) => o.active).toList();

  static void addOffer(AdminOffer offer) {
    _offers.add(offer);
  }

  static void removeOffer(AdminOffer offer) {
    _offers.remove(offer);
  }
}
