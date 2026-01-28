class Discount {
  final String title;
  final String code;
  final double percent;
  final bool vipOnly;
  final DateTime expiry;

  Discount({
    required this.title,
    required this.code,
    required this.percent,
    required this.expiry,
    this.vipOnly = false,
  });

  bool get isValid => DateTime.now().isBefore(expiry);
}
