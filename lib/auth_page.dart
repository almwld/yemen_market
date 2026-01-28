import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  Future<void> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleProvider = GoogleAuthProvider();
      final UserCredential userCredential = 
          await FirebaseAuth.instance.signInWithPopup(googleProvider);
      
      print('✅ تم التسجيل: ${userCredential.user?.email}');
    } catch (e) {
      print('❌ خطأ: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('سجل الدخول لمتابعة'),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: signInWithGoogle,
              icon: const Icon(Icons.g_mobiledata),
              label: const Text('سجل الدخول مع Google'),
            ),
          ],
        ),
      ),
    );
  }
}
