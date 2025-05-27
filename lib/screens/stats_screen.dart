// 1. stats_screen.dart — Page principale : sélection des ligues

import 'package:flutter/material.dart';
import 'club_list_screen.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  void openClubList(BuildContext context, String leagueName) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ClubListScreen(leagueName: leagueName),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final leagues = [
      {'name': 'Ligue 1', 'flag': 'assets/flags/fr.png'},
      {'name': 'Bundesliga', 'flag': 'assets/flags/de.png'},
      {'name': 'La Liga', 'flag': 'assets/flags/es.png'},
      {'name': 'Serie A', 'flag': 'assets/flags/it.png'},
      {'name': 'Premier League', 'flag': 'assets/flags/en.png'},
      {'name': 'Eredivisie', 'flag': 'assets/flags/nl.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("STATS"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: leagues.length,
        itemBuilder: (context, index) {
          final league = leagues[index];
          return GestureDetector(
            onTap: () => openClubList(context, league['name']!),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Container(
                    width: 32,
                    height: 32,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        color: Colors.white10,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: Image.asset(
                            league['flag']!,
                            fit: BoxFit.contain,
                        ),
                    ),
                ),
                title: Text(
                    league['name']!,
                    style: const TextStyle(fontSize: 18),
                ),      
              ),
            ),
          );
        },
      ),
    );
  }
}
