import '../models/smart_offer.dart';

class SmartOfferService {
  static List<SmartOffer> getOffers({
    required bool isVip,
  }) {
    final offers = <SmartOffer>[
      SmartOffer(
        title: '🔥 عرض شحن الإنترنت',
        description: 'خصم 10٪ لفترة محدودة',
        route: '/internet',
      ),
      SmartOffer(
        title: '💎 عرض VIP كريبتو',
        description: 'أسعار خاصة لأعضاء VIP',
        route: '/crypto',
        vipOnly: true,
      ),
    ];

    return offers.where((o) => !o.vipOnly || isVip).toList();
  }
}
