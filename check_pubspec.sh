#!/bin/bash

echo "🔍 فحص pubspec.yaml..."

# تحقق من وجود dependencies أساسية
required_deps=("firebase_core" "firebase_auth" "cloud_firestore" "provider" "cached_network_image")

for dep in "${required_deps[@]}"; do
    if grep -q "$dep" pubspec.yaml; then
        echo "✅ $dep"
    else
        echo "❌ $dep - غير موجود"
    fi
done

# تحقق من قسم flutter
echo ""
echo "📦 قسم flutter:"
if grep -q "flutter:" pubspec.yaml; then
    echo "✅ قسم flutter موجود"
    
    # تحقق من assets
    if grep -q "assets:" pubspec.yaml; then
        echo "✅ assets موجود"
    else
        echo "❌ assets غير موجود"
    fi
    
    # تحقق من uses-material-design
    if grep -q "uses-material-design" pubspec.yaml; then
        echo "✅ uses-material-design موجود"
    else
        echo "❌ uses-material-design غير موجود"
    fi
else
    echo "❌ قسم flutter غير موجود!"
fi
