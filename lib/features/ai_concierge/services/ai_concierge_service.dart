import '../models/ai_suggestion.dart';

class AiConciergeService {
  static List<AiSuggestion> suggest({
    required double budget,
  }) {
    final suggestions = <AiSuggestion>[];

    if (budget >= 10000) {
      suggestions.add(
        AiSuggestion(
          title: '📱 شحن رصيد',
          description: 'أفضل خيار سريع اليوم',
          price: 5000,
          route: '/payment-info',
        ),
      );
    }

    if (budget >= 30000) {
      suggestions.add(
        AiSuggestion(
          title: '🎮 شحن ألعاب',
          description: 'العرض الأكثر طلبًا',
          price: 25000,
          route: '/services',
        ),
      );
    }

    if (budget >= 50000) {
      suggestions.add(
        AiSuggestion(
          title: '✈️ حجز طيران',
          description: 'خصم أسبوعي مغري',
          price: 48000,
          route: '/services',
        ),
      );
    }

    return suggestions;
  }
}
