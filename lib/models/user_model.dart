import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;
  final String role; // 'user', 'seller', 'admin'
  final DateTime createdAt;
  final double walletBalance;
  final String? phoneNumber;
  final String? address;
  final List<String>? favoriteProducts;
  
  UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    this.role = 'user',
    required this.createdAt,
    this.walletBalance = 0.0,
    this.phoneNumber,
    this.address,
    this.favoriteProducts,
  });
  
  factory UserModel.fromFirestore(String uid, Map<String, dynamic> data) {
    return UserModel(
      uid: uid,
      email: data['email'] ?? '',
      displayName: data['displayName'],
      photoURL: data['photoURL'],
      role: data['role'] ?? 'user',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      walletBalance: (data['walletBalance'] ?? 0).toDouble(),
      phoneNumber: data['phoneNumber'],
      address: data['address'],
      favoriteProducts: data['favoriteProducts'] != null
          ? List<String>.from(data['favoriteProducts'])
          : null,
    );
  }
  
  Map<String, dynamic> toFirestore() {
    return {
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'role': role,
      'createdAt': FieldValue.serverTimestamp(),
      'walletBalance': walletBalance,
      'phoneNumber': phoneNumber,
      'address': address,
      'favoriteProducts': favoriteProducts,
      'updatedAt': FieldValue.serverTimestamp(),
    };
  }
  
  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'displayName': displayName,
      'photoURL': photoURL,
      'role': role,
      'createdAt': createdAt.toIso8601String(),
      'walletBalance': walletBalance,
      'phoneNumber': phoneNumber,
      'address': address,
      'favoriteProducts': favoriteProducts,
    };
  }
  
  // Create empty user
  static UserModel empty() {
    return UserModel(
      uid: '',
      email: '',
      createdAt: DateTime.now(),
      walletBalance: 0.0,
    );
  }
}
