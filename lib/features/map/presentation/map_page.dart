import 'package:flutter/material.dart';
import '../data/store_service.dart';
import '../data/store_model.dart';

class MapPage extends StatelessWidget {
  MapPage({super.key});

  final StoreService _service = StoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stores Map')),
      body: StreamBuilder<List<Store>>(
        stream: _service.getStores(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final stores = snapshot.data!;
          return ListView.builder(
            itemCount: stores.length,
            itemBuilder: (_, i) {
              final store = stores[i];
              return ListTile(
                leading: const Icon(Icons.store),
                title: Text(store.name),
                subtitle: Text('(${store.lat}, ${store.lng})'),
              );
            },
          );
        },
      ),
    );
  }
}
