class PaymentMethod {
  final String id;
  final String name;
  final String type; // wallet | bank | cash
  final bool active;

  PaymentMethod({
    required this.id,
    required this.name,
    required this.type,
    required this.active,
  });

  factory PaymentMethod.fromMap(String id, Map<String, dynamic> data) {
    return PaymentMethod(
      id: id,
      name: data['name'],
      type: data['type'],
      active: data['active'],
    );
  }
}
