class PaymentMethod {
  final String id;
  final String name;
  final String type; // bank | wallet

  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
  });
}
