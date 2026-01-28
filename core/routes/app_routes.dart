import '../../modules/travel/travel_module.dart';
import '../../modules/games/games_module.dart';
import '../../modules/telecom/telecom_module.dart';
import '../../modules/payments/payment_module.dart';

final appRoutes = {
  ...TravelModule.routes(),
  ...GamesModule.routes(),
  ...TelecomModule.routes(),
  ...PaymentModule.routes(),
};
