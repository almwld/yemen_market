echo "🚀 نشر Yemen Market..."
cd /workspaces/yemen_market_backup
flutter clean
flutter pub get
flutter build web --release
echo "✅ تم البناء!"
