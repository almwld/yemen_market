import 'user_role.dart';

class RoleService {
  static UserRole currentRole = UserRole.guest;

  static bool get isAdmin => currentRole == UserRole.admin;
  static bool get isSeller => currentRole == UserRole.seller;
  static bool get isUser => currentRole == UserRole.user;

  static void setRole(UserRole role) {
    currentRole = role;
  }
}
