import 'package:flutter/material.dart';
import '../core/features/feature_registry.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final bottomFeatures = features.take(3).toList();

    return Scaffold(
      appBar: AppBar(title: Text(bottomFeatures[index].title)),
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(child: Text('Yemen Market')),
            ...features.map((f) => ListTile(
                  leading: Icon(f.icon),
                  title: Text(f.title),
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => f.page),
                    );
                  },
                )),
          ],
        ),
      ),
      body: bottomFeatures[index].page,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (i) => setState(() => index = i),
        items: bottomFeatures
            .map((f) => BottomNavigationBarItem(
                  icon: Icon(f.icon),
                  label: f.title,
                ))
            .toList(),
      ),
    );
  }
}
