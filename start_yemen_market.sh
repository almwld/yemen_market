#!/bin/bash

echo "🇾🇪 Yemen Market - الإعداد السريع"

# الانتقال إلى المشروع
cd /workspaces/yemen_market_backup 2>/dev/null || {
    echo "❌ لم أجد المشروع في /workspaces/yemen_market_backup"
    echo "📁 الملفات الموجودة:"
    ls -la /workspaces/
    exit 1
}

echo "📍 المكان: $(pwd)"
echo "📦 الملفات:"
ls -la

# تحقق من pubspec.yaml
if [ ! -f "pubspec.yaml" ]; then
    echo "❌ لا يوجد pubspec.yaml"
    echo "📝 إنشاء نسخة أساسية..."
    
    cat > pubspec.yaml << 'PUBSPEC'
name: yemen_market
description: Yemen Market
publish_to: 'none'
version: 1.0.0+1

environment:
  sdk: '>=3.0.0 <4.0.0'

dependencies:
  flutter:
    sdk: flutter
  firebase_core: ^2.24.2
  firebase_auth: ^4.14.2
  cloud_firestore: ^4.15.0
  provider: ^6.1.1

dev_dependencies:
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true
PUBSPEC
fi

# تثبيت dependencies
echo "📦 تثبيت dependencies..."
flutter pub get

# تشغيل
echo "🚀 تشغيل Yemen Market..."
echo "👉 سيفتح على: http://localhost:8080"
echo "👉 في Codespace، انتقل إلى Ports tab وانقر على 🌐"
echo ""
flutter run -d web-server --web-port=8080 --web-hostname=0.0.0.0
