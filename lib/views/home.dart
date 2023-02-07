import 'dart:async';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeFormState();
}

class _HomeFormState extends State<Home> {
  final controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Go Whats!'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextFormField(
          decoration: const InputDecoration(
              icon: Icon(Icons.local_phone), labelText: 'Telefone'),
          controller: controller,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final tel = controller.text;
          final url = 'https://api.whatsapp.com/send?phone=55$tel';
          final uri = Uri.parse(url);
          launchUrl(uri);
        },
        child: const Icon(Icons.message),
      ),
    );
  }
}
