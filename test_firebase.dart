import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'lib/core/firebase/firebase_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  print('🧪 Starting Firebase Connection Test...');
  
  try {
    // Test Firebase initialization
    await FirebaseService.initialize();
    
    print('✅ Firebase Test PASSED!');
    print('📊 Firebase Services:');
    print('   • Auth: ${FirebaseService.auth.app.name}');
    print('   • Firestore: ${FirebaseService.firestore.app.name}');
    print('   • Storage: ${FirebaseService.storage.app.name}');
    
    // Test Firestore connection
    try {
      await FirebaseService.firestore.collection('test').doc('connection').set({
        'timestamp': FieldValue.serverTimestamp(),
        'test': 'successful',
      });
      print('✅ Firestore Write: OK');
      
      final doc = await FirebaseService.firestore.collection('test').doc('connection').get();
      print('✅ Firestore Read: OK - ${doc.data()}');
      
      // Clean up
      await FirebaseService.firestore.collection('test').doc('connection').delete();
      print('✅ Firestore Cleanup: OK');
      
    } catch (e) {
      print('⚠️ Firestore Test Warning: $e');
    }
    
    exit(0); // Exit successfully
  } catch (e) {
    print('❌ Firebase Test FAILED: $e');
    exit(1); // Exit with error
  }
}

