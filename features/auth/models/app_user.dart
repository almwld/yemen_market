import '../../../core/auth/user_role.dart';

class AppUser {
  final String id;
  final String email;
  final UserRole role;

  AppUser({
    required this.id,
    required this.email,
    required this.role,
  });

  factory AppUser.fromMap(String id, Map<String, dynamic> data) {
    return AppUser(
      id: id,
      email: data['email'] ?? '',
      role: UserRoleX.fromString(data['role'] ?? 'user'),
    );
  }
}
