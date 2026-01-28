import '../models/offer_model.dart';

final offers = [
  Offer(
    id: '1',
    title: 'خصم 50% على المطاعم',
    discount: 0.5,
    expiresAt: DateTime.now().add(Duration(hours: 5)),
  ),
  Offer(
    id: '2',
    title: 'عروض السفر الصيفية',
    discount: 0.3,
    expiresAt: DateTime.now().add(Duration(days: 1)),
  ),
];
