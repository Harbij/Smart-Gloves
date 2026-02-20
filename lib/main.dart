import 'package:flutter/material.dart';

void main() {
  runApp(const SmartGloveApp());
}

class SmartGloveApp extends StatelessWidget {
  const SmartGloveApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smart Glove Translator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    TranslatePage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.teal,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.translate), label: 'Translate'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Glove Translator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            Card(
              child: ListTile(
                leading: Icon(Icons.bluetooth, color: Colors.green),
                title: Text("Bluetooth Status"),
                subtitle: Text("Connected"),
                trailing: Text("85%"),
              ),
            ),
            SizedBox(height: 20),
            Text(
              "Glove Status: Ready",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

class TranslatePage extends StatelessWidget {
  const TranslatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Translate"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.mic, size: 80, color: Colors.teal),
            SizedBox(height: 20),
            Text("Listening...", style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: ListView(
        children: const [
          ListTile(
            leading: Icon(Icons.language),
            title: Text("App Language"),
            subtitle: Text("English"),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text("Voice Output"),
          ),
        ],
      ),
    );
  }
}