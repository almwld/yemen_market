import '../models/user_role.dart';

class AuthService {
  static UserRole currentRole = UserRole.guest;

  static bool loginWithCode(String code) {
    if (code == 'deer') {
      currentRole = UserRole.user;
      return true;
    }
    return false;
  }

  static void loginAsAdmin() {
    currentRole = UserRole.admin;
  }

  static bool get isAdmin => currentRole == UserRole.admin;
  static bool get isUser => currentRole == UserRole.user;
}
