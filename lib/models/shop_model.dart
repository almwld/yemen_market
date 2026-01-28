class Shop {
  final String id;
  final String name;
  final double lat;
  final double lng;
  final bool approved;

  Shop({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
    required this.approved,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'lng': lng,
      'approved': approved,
    };
  }
}
