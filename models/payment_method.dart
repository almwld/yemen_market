class PaymentMethod {
  final String id;
  final String name;
  final String type; // wallet | bank | cash
  final bool enabled;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
    required this.enabled,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'type': type,
      'enabled': enabled,
    };
  }
}
