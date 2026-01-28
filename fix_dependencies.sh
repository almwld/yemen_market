#!/bin/bash

echo "🔧 إصلاح مشاكل dependencies..."

# 1. تحديث intl
flutter pub remove intl
flutter pub add intl:^0.20.2

# 2. تحديث جميع packages
flutter pub upgrade --major-versions

# 3. التحقق من التوافق
echo "📊 جاري التحقق من التوافق..."
flutter pub deps --style=tree | grep -E "(intl|flutter_localizations)"

# 4. تنظيف وإعادة بناء
flutter clean
flutter pub get

echo "✅ تم إصلاح dependencies!"
