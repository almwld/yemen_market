import 'ad_model.dart';

class AdService {
  static List<AdModel> ads = [
    AdModel(
      title: '🔥 عرض الأسبوع',
      subtitle: 'خصم 30% على الدفع',
      lottie: 'assets/lottie/offer.json',
      active: true,
    ),
    AdModel(
      title: '💎 VIP',
      subtitle: 'خدمات حصرية للأعضاء',
      lottie: 'assets/lottie/vip.json',
      active: true,
    ),
  ];

  static List<AdModel> getActiveAds() =>
      ads.where((e) => e.active).toList();
}
