class AdminOffer {
  final String title;
  final String description;
  final String route;
  final bool vipOnly;
  final bool active;

  AdminOffer({
    required this.title,
    required this.description,
    required this.route,
    this.vipOnly = false,
    this.active = true,
  });
}
