#!/bin/bash

echo "🧪 اختبار بناء Yemen Market محلياً..."

# 1. التحقق من الملفات
echo "🔍 التحقق من الملفات المطلوبة:"
required_files=("pubspec.yaml" "lib/main.dart" "lib/core/firebase/firebase_config.dart")
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo "✅ $file"
    else
        echo "❌ $file - غير موجود"
        exit 1
    fi
done

# 2. التحقق من dependencies
echo "📦 التحقق من dependencies..."
if grep -q "firebase_storage" pubspec.yaml; then
    echo "✅ firebase_storage موجود في pubspec.yaml"
else
    echo "❌ firebase_storage غير موجود - سيتم إضافته"
    flutter pub add firebase_storage:^11.3.1
fi

# 3. تثبيت dependencies
echo "🔄 تثبيت dependencies..."
flutter pub get

# 4. تحليل الكود
echo "🔍 تحليل الكود..."
flutter analyze

# 5. محاولة البناء
echo "🏗️ محاولة البناء..."
flutter build apk --debug

if [ $? -eq 0 ]; then
    echo "🎉 ✅ البناء نجح محلياً!"
    echo "📱 يمكنك الآن استخدام Codemagic للبناء النهائي"
else
    echo "❌ البناء فشل، راجع الأخطاء أعلاه"
    exit 1
fi
