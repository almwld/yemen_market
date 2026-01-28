enum UserRole {
  user,
  trader,
  admin,
}

extension UserRoleX on UserRole {
  static UserRole fromString(String value) {
    switch (value) {
      case 'admin':
        return UserRole.admin;
      case 'trader':
        return UserRole.trader;
      default:
        return UserRole.user;
    }
  }

  String get name => toString().split('.').last;
}
