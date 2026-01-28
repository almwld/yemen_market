#!/bin/bash

echo "🚀 Yemen Market Development Environment Setup"
echo "============================================"

# Install Flutter
if [ ! -d "/opt/flutter" ]; then
    echo "📦 Installing Flutter SDK..."
    git clone https://github.com/flutter/flutter.git -b stable /opt/flutter --depth 1
    export PATH="$PATH:/opt/flutter/bin"
    echo "✅ Flutter installed successfully"
else
    export PATH="$PATH:/opt/flutter/bin"
    echo "✅ Flutter already installed"
fi

# Enable Flutter Web
echo "🌐 Configuring Flutter for web..."
flutter config --enable-web

# Install dependencies
echo "📦 Installing project dependencies..."
flutter pub get

# Install Firebase CLI
echo "🔥 Installing Firebase CLI..."
npm install -g firebase-tools

# Check Flutter installation
echo "🔍 Checking Flutter installation..."
flutter doctor

# Create aliases
echo "⚡ Creating useful aliases..."
echo "" >> ~/.bashrc
echo "# Yemen Market Aliases" >> ~/.bashrc
echo "alias run-web=\"flutter run -d web-server --web-port=8080 --web-hostname 0.0.0.0 --verbose\"" >> ~/.bashrc
echo "alias build-web=\"flutter build web --release --web-renderer html\"" >> ~/.bashrc
echo "alias deploy-firebase=\"firebase deploy --only hosting\"" >> ~/.bashrc
echo "alias test-auth=\"dart test_auth.dart\"" >> ~/.bashrc
echo "alias fdoctor=\"flutter doctor -v\"" >> ~/.bashrc
echo "alias fclean=\"flutter clean && flutter pub get\"" >> ~/.bashrc

# Create test file for Firebase
echo "🧪 Creating Firebase test file..."
cat > test_auth.dart << \"DARTEOF\"
import "package:firebase_core/firebase_core.dart";

void main() async {
  print("Testing Firebase configuration...");
  
  final config = {
    "apiKey": "AIzaSyDK_sSIUTKRU2lJS7HlUOrQ-3rde-KbWoA",
    "authDomain": "yemenmarket-6efa1.firebaseapp.com",
    "projectId": "yemenmarket-6efa1",
    "storageBucket": "yemenmarket-6efa1.firebasestorage.app",
    "messagingSenderId": "386995199915",
    "appId": "1:386995199915:web:cdde7666a6d793a3753cee",
  };
  
  print("Firebase Config:");
  config.forEach((key, value) => print("  \$key: \$value"));
  print("
✅ Firebase configuration looks good!");
  
  try {
    await Firebase.initializeApp(options: FirebaseOptions(
      apiKey: config["apiKey"]!,
      authDomain: config["authDomain"]!,
      projectId: config["projectId"]!,
      storageBucket: config["storageBucket"]!,
      messagingSenderId: config["messagingSenderId"]!,
      appId: config["appId"]!,
    ));
    
    print("🎉 Firebase initialized successfully!");
  } catch (e) {
    print("❌ Error initializing Firebase: \$e");
  }
}
DARTEOF

echo ""
echo "✅ Setup complete!"
echo ""
echo "🚀 Quick Start:"
echo "1. Run: run-web"
echo "2. Open Ports tab in VS Code"
echo "3. Click the link next to port 8080"

