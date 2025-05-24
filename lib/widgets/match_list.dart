import 'package:flutter/material.dart';
import '../models/match.dart';

class MatchList extends StatelessWidget {
  final List<Match> matches;

  const MatchList({super.key, required this.matches});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            padding: const EdgeInsets.all(8.0),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Image.asset(match.logoA, height: 24),
                    const SizedBox(width: 6),
                    Expanded(child: Text(match.teamA, style: const TextStyle(fontSize: 12))),
                    Text(match.scoreA.toString(), style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Image.asset(match.logoB, height: 24),
                    const SizedBox(width: 6),
                    Expanded(child: Text(match.teamB, style: const TextStyle(fontSize: 12))),
                    Text(match.scoreB.toString(), style: const TextStyle(fontSize: 14)),
                  ],
                ),
                const SizedBox(height: 4),
                Text(match.status, style: const TextStyle(fontSize: 10, color: Colors.grey)),
              ],
            ),
          );
        },
      ),
    );
  }
}
