import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../services/wallet_image_service.dart';

class WalletImagePage extends StatefulWidget {
  const WalletImagePage({super.key});

  @override
  State<WalletImagePage> createState() => _WalletImagePageState();
}

class _WalletImagePageState extends State<WalletImagePage> {
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final picked =
        await _picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      WalletImageService.setImage(File(picked.path));
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final image = WalletImageService.getImage();

    return Scaffold(
      appBar: AppBar(title: const Text('صورة محفظة الدفع')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            GestureDetector(
              onTap: _pickImage,
              child: Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey),
                ),
                child: image == null
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add_a_photo, size: 40),
                            SizedBox(height: 8),
                            Text('اضغط لرفع صورة المحفظة'),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.file(
                          image,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('✅ تم حفظ صورة المحفظة'),
                  ),
                );
              },
              icon: const Icon(Icons.save),
              label: const Text('حفظ'),
            ),
          ],
        ),
      ),
    );
  }
}
