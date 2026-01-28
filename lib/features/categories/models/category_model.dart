class CategoryModel {
  final String id;
  final String name;
  final String description;
  final bool active;

  CategoryModel({
    required this.id,
    required this.name,
    required this.description,
    this.active = true,
  });

  CategoryModel copyWith({bool? active}) {
    return CategoryModel(
      id: id,
      name: name,
      description: description,
      active: active ?? this.active,
    );
  }
}
