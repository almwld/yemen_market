class SellerModel {
  final String id;
  final String name;
  final bool approved;
  final DateTime createdAt;

  SellerModel({
    required this.id,
    required this.name,
    required this.approved,
    required this.createdAt,
  });

  SellerModel copyWith({bool? approved}) {
    return SellerModel(
      id: id,
      name: name,
      approved: approved ?? this.approved,
      createdAt: createdAt,
    );
  }
}
