# 🛒 Yemen Market - Flutter E-commerce Platform

A comprehensive e-commerce application for the Yemeni market built with Flutter and Firebase.

## 🌐 Live Links
- **Web Application**: https://yemenmarket-6efa1.web.app
- **Firebase Console**: https://console.firebase.google.com/project/yemenmarket-6efa1
- **GitHub Repository**: https://github.com/almwld/yemen_market_backup
- **GitHub Codespace**: https://codespaces.new/almwld/yemen_market_backup

## 🚀 Features
- ✅ Google Authentication
- ✅ Product Marketplace
- ✅ Seller Dashboard
- ✅ Admin Control Panel
- ✅ Digital Wallet System
- ✅ AI Chat Assistant
- ✅ Real-time Notifications
- ✅ Multi-language Support (Arabic/English)

## 🛠️ Tech Stack
- **Frontend**: Flutter 3.19 (Web)
- **Backend**: Firebase (Auth, Firestore, Storage, Functions)
- **State Management**: Flutter Bloc + Hydrated Bloc
- **Deployment**: Firebase Hosting + GitHub Actions
- **Database**: Cloud Firestore (NoSQL)

## 📁 Project Structure
```
yemen_market_backup/
├── lib/
│   ├── core/                 # Core utilities
│   │   ├── auth/            # Authentication services
│   │   ├── firebase/        # Firebase services
│   │   ├── theme/           # App theming
│   │   └── utils/           # Utilities
│   ├── features/            # Feature modules
│   │   ├── auth/           # User authentication
│   │   ├── products/       # Product management
│   │   ├── cart/           # Shopping cart
│   │   ├── admin/          # Admin panel
│   │   ├── seller/         # Seller dashboard
│   │   ├── wallet/         # Digital wallet
│   │   └── chat/           # AI chat assistant
│   ├── models/             # Data models
│   ├── services/           # Business services
│   └── main.dart           # App entry point
├── assets/                 # Images, icons, animations
├── functions/              # Firebase Cloud Functions
├── .devcontainer/          # GitHub Codespace configuration
└── .github/workflows/      # CI/CD pipelines
```

## 🏗️ Getting Started

### Using GitHub Codespace (Recommended)
1. Visit: https://codespaces.new/almwld/yemen_market_backup
2. Wait for environment setup (2-3 minutes)
3. In terminal, run: `run-web`
4. Open Ports tab and click link next to port 8080

### Local Development
```bash
# Clone repository
git clone https://github.com/almwld/yemen_market_backup.git
cd yemen_market_backup

# Install dependencies
flutter pub get

# Run development server
flutter run -d web-server --web-port=8080
```

## 🚀 Quick Commands (in Codespace)
```bash
run-web       # Start development server
build-web     # Build for production
deploy-firebase  # Deploy to Firebase Hosting
test-auth     # Test Firebase configuration
fdoctor       # Check Flutter installation
fclean        # Clean and refresh dependencies
```

## 🔥 Firebase Deployment
```bash
# Build production version
flutter build web --release

# Deploy to Firebase Hosting
firebase deploy --only hosting
```

## 🔐 Firebase Setup

### 1. Enable Google Sign-In
1. Go to Firebase Console → Authentication → Sign-in method
2. Enable Google provider
3. Add support email

### 2. Configure Firestore Database
1. Create Firestore database
2. Set security rules
3. Create collections: users, products, orders, etc.

### 3. Configure Storage
1. Enable Cloud Storage
2. Set rules for file uploads

## 📱 Platform Support
- ✅ Web (Primary)
- ✅ Android (Ready)
- ✅ iOS (Ready)
- ✅ Desktop (Planned)

## 🤝 Contributing
1. Fork the repository
2. Create feature branch
3. Commit changes
4. Push to branch
5. Open Pull Request

## 📄 License
MIT License

## 📞 Contact & Support
- **Developer**: Almwld Ahmed
- **GitHub**: [@almwld](https://github.com/almwld)
- **Email**: almwldahmed199@gmail.com

## 🙏 Acknowledgments
- Flutter & Dart Teams
- Firebase Team
- Open Source Community
- Yemeni Developers
