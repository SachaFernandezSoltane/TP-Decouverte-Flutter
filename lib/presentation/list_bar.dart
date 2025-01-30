import 'package:flutter/material.dart';
import 'package:tp1/presentation/home.dart';

class MyListPage extends StatefulWidget {
  const MyListPage({super.key});

  @override
  State<MyListPage> createState() => _MyListPageState();
}

class _MyListPageState extends State<MyListPage> {
   void _openDetailPage(String name, String address) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MyDetailsPage(name: name, address: address),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Liste bar'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: <Widget>[
            ListTile(
              title: const Text('Désordre', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('18 rue Georges Charpak\n35700 Rennes'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 236, 10, 161)),
              onTap: () {
                 _openDetailPage('Désordre', '18 rue Georges Charpak\n35700 Rennes');
              },
            ),
            const Divider(), // Séparateur entre les éléments

            ListTile(
              title: const Text('Désordre2', style: TextStyle(fontWeight: FontWeight.bold)),
              subtitle: const Text('19 rue Georges Charpak\n35700 Rennes'),
              trailing: const Icon(Icons.arrow_forward_ios, color: Color.fromARGB(255, 236, 10, 161)),
              onTap: () {
                 _openDetailPage('Désordre2', '19 rue Georges Charpak\n35700 Rennes');
              },
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
