class SmartOffer {
  final String title;
  final String description;
  final String route;
  final bool vipOnly;

  SmartOffer({
    required this.title,
    required this.description,
    required this.route,
    this.vipOnly = false,
  });
}
