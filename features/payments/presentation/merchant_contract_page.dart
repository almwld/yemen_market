import 'package:flutter/material.dart';

class MerchantContractPage extends StatelessWidget {
  const MerchantContractPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('عقد التاجر')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: const Text(
          '''
1- يلتزم التاجر بجودة المنتجات.
2- نسبة عمولة السوق 5% من كل عملية بيع.
3- يحق للسوق إيقاف الحساب عند المخالفة.
4- يتم تحويل الأرباح تلقائيًا إلى محفظة التاجر.
5- يخضع هذا العقد لأنظمة سوق اليمن.
          ''',
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
