import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Settings")),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("App Language"),
            trailing: const Text("English"),
            onTap: () {},
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.translate),
            title: const Text("Translation Language"),
            trailing: const Text("Arabic"),
            onTap: () {},
          ),
          const Divider(),
          SwitchListTile(
            title: const Text("Voice Output"),
            value: true,
            onChanged: (value) {},
          ),
        ],
      ),
    );
  }
}