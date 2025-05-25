import 'package:flutter/material.dart';

class ClubStatsScreen extends StatelessWidget {
  final String clubName;
  final String logoPath;

  const ClubStatsScreen({super.key, required this.clubName, required this.logoPath});

  @override
  Widget build(BuildContext context) {
    // Statistiques factices pour l'exemple
    final winRate = 80;
    final avgGoals = 2.3;
    final form = ["V", "V", "N", "D", "V"];

    return Scaffold(
      appBar: AppBar(title: Text(clubName)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(logoPath, height: 40),
                const SizedBox(width: 10),
                Text(clubName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 24),
            Text("Forme récente:", style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 10),
            Row(
              children: form.map((f) {
                Color color = f == "V"
                    ? Colors.green
                    : f == "N"
                        ? Colors.yellow
                        : Colors.red;
                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
                  child: Text(f, style: const TextStyle(color: Colors.black)),
                );
              }).toList(),
            ),
            const SizedBox(height: 24),
            Text("% de victoires : $winRate%"),
            Text("Moyenne de buts : $avgGoals"),
          ],
        ),
      ),
    );
  }
}
