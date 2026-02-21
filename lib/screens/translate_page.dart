import 'package:flutter/material.dart';

class TranslatePage extends StatefulWidget {
  const TranslatePage({super.key});

  @override
  State<TranslatePage> createState() => _TranslatePageState();
}

class _TranslatePageState extends State<TranslatePage> {
  bool isListening = false;
  String translatedText = "Hello! How can I help you today?";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Translate")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(color: Colors.black12, blurRadius: 8)
                ],
              ),
              child: Text(
                translatedText,
                style: const TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                setState(() {
                  isListening = !isListening;
                });
              },
              child: CircleAvatar(
                radius: 40,
                backgroundColor: isListening ? Colors.red : Colors.teal,
                child: const Icon(Icons.mic, color: Colors.white, size: 40),
              ),
            ),
            const SizedBox(height: 20),
            Text(isListening ? "Listening..." : "Tap to Listen"),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}