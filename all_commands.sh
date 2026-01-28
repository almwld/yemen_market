#!/bin/bash

# أوامر إعداد Yemen Market

# 1. تحديث النظام
echo "🔄 تحديث النظام..."
apt-get update && apt-get upgrade -y

# 2. تثبيت Flutter (إذا لم يكن مثبتاً)
echo "📦 تثبيت Flutter..."
if ! command -v flutter &> /dev/null; then
    git clone https://github.com/flutter/flutter.git -b stable
    export PATH="$PATH:/workspaces/yemen_market_backup/flutter/bin"
    echo 'export PATH="$PATH:/workspaces/yemen_market_backup/flutter/bin"' >> ~/.bashrc
fi

# 3. تنظيف المشروع
echo "🧹 تنظيف المشروع..."
flutter clean

# 4. تحديث pubspec.yaml
echo "📝 تحديث pubspec.yaml..."
cat > pubspec.yaml << 'PUBSPEC'
name: yemen_market
description: Yemen Market - Online Marketplace
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  cupertino_icons: ^1.0.2
  firebase_core: ^2.24.2
  firebase_auth: ^4.14.2
  cloud_firestore: ^4.15.0
  firebase_storage: ^11.3.1
  google_sign_in: ^6.1.5
  google_sign_in_web: ^0.12.4+4
  provider: ^6.1.1
  cached_network_image: ^3.3.0
  image_picker: ^1.0.4
  intl: ^0.20.2
  http: ^1.1.0
  shared_preferences: ^2.2.2
  uuid: ^4.3.3
  flutter_localizations:
    sdk: flutter

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0

flutter:
  uses-material-design: true
  
  # Assets
  assets:
    - assets/images/products/
    - assets/images/icons/
    - assets/animations/
    - assets/lottie/
  
  # Fonts
  fonts:
    - family: Cairo
      fonts:
        - asset: assets/fonts/Cairo-Regular.ttf
        - asset: assets/fonts/Cairo-Bold.ttf
          weight: 700
PUBSPEC

# 5. تثبيت dependencies
echo "📦 تثبيت dependencies..."
flutter pub get

# 6. إنشاء هيكل المجلدات
echo "📁 إنشاء هيكل المجلدات..."
mkdir -p lib/core/{auth,firebase,theme,utils,constants,services,widgets}
mkdir -p lib/features/auth/{data,domain,presentation,services}
mkdir -p lib/features/products/{data,domain,presentation,services}
mkdir -p lib/features/cart/{data,domain,presentation,services}
mkdir -p lib/features/admin/{data,domain,presentation,services}
mkdir -p lib/features/seller/{data,domain,presentation,services}
mkdir -p lib/features/wallet/{data,domain,presentation,services}
mkdir -p lib/features/chat/{data,domain,presentation,services}
mkdir -p lib/{models,services,shared,ui,routes}
mkdir -p assets/images/{products,icons}
mkdir -p assets/{animations,lottie,fonts}

# 7. إنشاء ملفات Firebase الأساسية
echo "🔥 إنشاء ملفات Firebase..."
cat > lib/core/firebase/firebase_config.dart << 'FIREBASE_CONFIG'
class FirebaseConfig {
  static const apiKey = "AIzaSyDK_sSIUTKRU2lJS7HlUOrQ-3rde-KbWoA";
  static const authDomain = "yemenmarket-6efa1.firebaseapp.com";
  static const projectId = "yemenmarket-6efa1";
  static const storageBucket = "yemenmarket-6efa1.firebasestorage.app";
  static const messagingSenderId = "386995199915";
  static const appId = "1:386995199915:web:cdde7666a6d793a3753cee";
}
FIREBASE_CONFIG

# 8. تشغيل التطبيق
echo "🚀 جاهز للتشغيل!"
echo "👉 تشغيل: flutter run -d web-server --web-port=8080"
