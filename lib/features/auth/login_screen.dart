import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'otp_screen.dart';
import '../home/home_screen.dart';
import '../../core/services/guest_auth_service.dart';
import '../../core/services/user_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final phoneController = TextEditingController();
  bool loading = false;

  void sendCode() async {
    setState(() => loading = true);
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+967${phoneController.text}',
      verificationCompleted: (_) {},
      verificationFailed: (_) => setState(() => loading = false),
      codeSent: (id, _) {
        setState(() => loading = false);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => OtpScreen(verificationId: id),
          ),
        );
      },
      codeAutoRetrievalTimeout: (_) {},
    );
  }

  void guestLogin() async {
    await GuestAuthService.signInAsGuest();
    await UserService.saveUser(guest: true);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تسجيل الدخول')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'رقم الهاتف'),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: loading ? null : sendCode,
              child: const Text('تسجيل برقم الهاتف'),
            ),
            const Divider(height: 40),
            OutlinedButton(
              onPressed: guestLogin,
              child: const Text('الدخول كضيف'),
            )
          ],
        ),
      ),
    );
  }
}
