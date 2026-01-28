class Store {
  final String id;
  final String name;
  final double lat;
  final double lng;

  Store({
    required this.id,
    required this.name,
    required this.lat,
    required this.lng,
  });

  factory Store.fromMap(String id, Map<String, dynamic> data) {
    return Store(
      id: id,
      name: data['name'],
      lat: (data['lat'] as num).toDouble(),
      lng: (data['lng'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'lat': lat,
      'lng': lng,
    };
  }
}
