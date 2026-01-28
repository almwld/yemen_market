class AiOfferService {
  static String suggestOffer({
    required String lastService,
    required bool isVip,
  }) {
    if (lastService == 'internet') {
      return '🔥 خصم على باقات الإنترنت الكبيرة';
    }

    if (lastService == 'games') {
      return '🎮 شحن ألعاب + Bonus';
    }

    if (isVip) {
      return '💎 عرض VIP خاص لك';
    }

    return '✨ عرض مميز اليوم';
  }
}
