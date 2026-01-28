import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'firebase_config.dart';

class FirebaseService {
  static FirebaseAuth get auth => FirebaseAuth.instance;
  static FirebaseFirestore get firestore => FirebaseFirestore.instance;
  
  // Collections references
  static CollectionReference get usersCollection => 
      firestore.collection(FirebaseConfig.usersCollection);
  
  static CollectionReference get productsCollection => 
      firestore.collection(FirebaseConfig.productsCollection);
  
  // Initialize Firebase
  static Future<void> initialize() async {
    try {
      await Firebase.initializeApp(
        options: const FirebaseOptions(
          apiKey: FirebaseConfig.config['apiKey']!,
          authDomain: FirebaseConfig.config['authDomain']!,
          projectId: FirebaseConfig.config['projectId']!,
          storageBucket: FirebaseConfig.config['storageBucket']!,
          messagingSenderId: FirebaseConfig.config['messagingSenderId']!,
          appId: FirebaseConfig.config['appId']!,
        ),
      );
      
      print('✅ Firebase initialized successfully');
      
    } catch (e) {
      print('❌ Firebase initialization failed: \$e');
      rethrow;
    }
  }
}
