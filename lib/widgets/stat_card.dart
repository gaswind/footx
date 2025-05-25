import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String club;
  final String logoPath;
  final int winRate;
  final double avgGoals;
  final List<String> form;

  const StatCard({
    super.key,
    required this.club,
    required this.logoPath,
    required this.winRate,
    required this.avgGoals,
    required this.form,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white10,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(logoPath, height: 40),
              const SizedBox(width: 12),
              Text(club, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Win rate: $winRate%"),
              Text("Avg goals: $avgGoals"),
            ],
          ),
          const SizedBox(height: 12),
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
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(f, style: const TextStyle(color: Colors.black)),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
