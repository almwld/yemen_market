#!/bin/bash

echo "🔧 إصلاح بناء Yemen Market..."

# 1. تحديث pubspec.yaml
echo "📦 تحديث dependencies..."
if ! grep -q "firebase_storage" pubspec.yaml; then
    echo "➕ إضافة firebase_storage إلى pubspec.yaml"
    sed -i '/firebase_auth:.*/a\  firebase_storage: ^11.3.1' pubspec.yaml
fi

# 2. تثبيت dependencies
flutter pub get

# 3. التحقق من تثبيت firebase_storage
echo "🔍 التحقق من الحزم المثبتة..."
flutter pub deps | grep firebase_storage || echo "⚠️ firebase_storage غير مثبت"

# 4. إذا كان لا يزال هناك مشكلة، استخدم إصداراً أقدم
echo "🔄 محاولة بإصدار أقدم..."
flutter pub remove firebase_storage
flutter pub add firebase_storage:10.3.14  # إصدار أقدم وأكثر استقراراً

# 5. تنظيف وإعادة بناء
flutter clean
flutter pub get

echo "✅ جاهز للمحاولة مرة أخرى!"
