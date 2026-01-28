class ServiceModel {
  final String id;
  final String title;
  final String description;
  final String icon;
  final bool adminOnly;

  ServiceModel({
    required this.id,
    required this.title,
    required this.description,
    required this.icon,
    this.adminOnly = false,
  });
}
