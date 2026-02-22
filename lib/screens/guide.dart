import 'package:flutter/material.dart';
import '../main.dart';

class Guide extends StatelessWidget {
  const Guide({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFFE3F2FD),
              Colors.white,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [

                const SizedBox(height: 40),

                // 🔷 Logo Box
                Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D47A1),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.gesture,
                    color: Colors.white,
                    size: 60,
                  ),
                ),

                const SizedBox(height: 20),

                const Text(
                  "How to Use ناطق",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0D47A1),
                  ),
                  textAlign: TextAlign.center,
                ),

                const SizedBox(height: 30),

                // 🔽 Scrollable Cards
                Expanded(
                  child: ListView(
                    children: const [

                      GuideCard(
                        icon: Icons.bluetooth,
                        title: "Connect the Smart Glove",
                        description:
                            "Turn on the Smart Glove and enable Bluetooth. "
                            "The app will detect and connect automatically.",
                      ),

                      GuideCard(
                        icon: Icons.gesture,
                        title: "Perform Hand Gestures",
                        description:
                            "Wear the glove and perform sign language gestures. "
                            "Flex sensors capture finger movements in real-time.",
                      ),

                      GuideCard(
                        icon: Icons.mic,
                        title: "Instant Translation",
                        description:
                            "Gestures are converted into text and spoken "
                            "aloud instantly using the AI system.",
                      ),

                      GuideCard(
                        icon: Icons.battery_full,
                        title: "Monitor System Status",
                        description:
                            "Check connection, battery level, and system "
                            "health from the Home screen.",
                      ),

                      GuideCard(
                        icon: Icons.settings,
                        title: "Customize Settings",
                        description:
                            "Adjust language preferences and user settings "
                            "inside the Settings page.",
                      ),

                      SizedBox(height: 20),
                    ],
                  ),
                ),

                // 🔵 Continue Button
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1976D2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainNavigation(),
                        ),
                      );
                    },
                    child: const Text(
                      "Start Using App",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GuideCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;

  const GuideCard({
    super.key,
    required this.icon,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.only(bottom: 20),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Icon(
              icon,
              size: 40,
              color: const Color(0xFF1565C0),
            ),
            const SizedBox(height: 15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF0D47A1),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: const TextStyle(fontSize: 14),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}