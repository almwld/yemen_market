import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  final String id;
  final String name;
  final String description;
  final double price;
  final List<String> images;
  final String category;
  final String sellerId;
  final String sellerName;
  final bool approved;
  final DateTime createdAt;
  final int stock;
  final double? discount;
  final double rating;
  final int reviewCount;
  final String? unit; // كيلو، قطعة، لتر، إلخ
  
  ProductModel({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.images,
    required this.category,
    required this.sellerId,
    required this.sellerName,
    this.approved = false,
    required this.createdAt,
    this.stock = 0,
    this.discount,
    this.rating = 0.0,
    this.reviewCount = 0,
    this.unit,
  });
  
  factory ProductModel.fromFirestore(String id, Map<String, dynamic> data) {
    return ProductModel(
      id: id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      price: (data['price'] ?? 0).toDouble(),
      images: List<String>.from(data['images'] ?? []),
      category: data['category'] ?? '',
      sellerId: data['sellerId'] ?? '',
      sellerName: data['sellerName'] ?? '',
      approved: data['approved'] ?? false,
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      stock: data['stock'] ?? 0,
      discount: data['discount']?.toDouble(),
      rating: (data['rating'] ?? 0).toDouble(),
      reviewCount: data['reviewCount'] ?? 0,
      unit: data['unit'],
    );
  }
  
  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'images': images,
      'category': category,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'approved': approved,
      'createdAt': FieldValue.serverTimestamp(),
      'stock': stock,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
      'unit': unit,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
  
  // Get final price after discount
  double get finalPrice {
    if (discount != null && discount! > 0) {
      return price - (price * discount! / 100);
    }
    return price;
  }
  
  // Check if product is in stock
  bool get inStock => stock > 0;
  
  // Check if product has discount
  bool get hasDiscount => discount != null && discount! > 0;
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'finalPrice': finalPrice,
      'images': images,
      'category': category,
      'sellerId': sellerId,
      'sellerName': sellerName,
      'approved': approved,
      'createdAt': createdAt.toIso8601String(),
      'stock': stock,
      'discount': discount,
      'rating': rating,
      'reviewCount': reviewCount,
      'unit': unit,
      'inStock': inStock,
      'hasDiscount': hasDiscount,
    };
  }
}
