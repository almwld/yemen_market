#!/usr/bin/env bash
set -e

echo "🔎 Check Flutter embedding (v2 only)"

# ❌ تحقق من v1 الحقيقي فقط
if grep -R "io.flutter.app" -n android; then
  echo "❌ v1 embedding found (io.flutter.app)"
  exit 1
fi

echo "✅ Flutter v2 embedding OK"
