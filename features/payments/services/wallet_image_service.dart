import 'dart:io';

class WalletImageService {
  static File? _walletImage;

  static void setImage(File image) {
    _walletImage = image;
  }

  static File? getImage() {
    return _walletImage;
  }

  static bool hasImage() {
    return _walletImage != null;
  }
}
