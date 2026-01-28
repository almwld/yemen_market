import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../home/home_screen.dart';

class OtpScreen extends StatefulWidget {
  final String verificationId;
  const OtpScreen({super.key, required this.verificationId});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final codeController = TextEditingController();
  bool loading = false;

  void verifyCode() async {
    setState(() => loading = true);
    final cred = PhoneAuthProvider.credential(
      verificationId: widget.verificationId,
      smsCode: codeController.text,
    );
    await FirebaseAuth.instance.signInWithCredential(cred);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('إدخال الرمز')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: codeController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'رمز التحقق'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: loading ? null : verifyCode,
              child: loading
                  ? const CircularProgressIndicator()
                  : const Text('تأكيد'),
            )
          ],
        ),
      ),
    );
  }
}
