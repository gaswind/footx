import 'package:flutter/material.dart';
import 'club_stats_screen.dart';

class ClubListScreen extends StatelessWidget {
  final String leagueName;
  const ClubListScreen({super.key, required this.leagueName});

  @override
  Widget build(BuildContext context) {
    final clubs = {
      'Ligue 1': [
        {'name': 'PSG', 'logo': 'assets/clubs/psg.png'},
        {'name': 'OM', 'logo': 'assets/clubs/om.png'},
        {'name': 'OL', 'logo': 'assets/clubs/ol.png'},
        {'name': 'RC Lens', 'logo': 'assets/clubs/lens.png'},
        {'name': 'Toulouse', 'logo': 'assets/clubs/toulouse.png'},
        {'name': 'RC Strasbourg', 'logo': 'assets/clubs/strasbourg.png'},
      ],
      // Tu peux ajouter d'autres ligues ici
    };

    final selectedClubs = clubs[leagueName] ?? [];

    return Scaffold(
      appBar: AppBar(title: Text(leagueName)),
      body: ListView.builder(
        itemCount: selectedClubs.length,
        itemBuilder: (context, index) {
          final club = selectedClubs[index];
          return GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ClubStatsScreen(clubName: club['name']!, logoPath: club['logo']!),
              ),
            ),
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListTile(
                leading: Image.asset(club['logo']!, height: 32),
                title: Text(club['name']!, style: const TextStyle(fontSize: 18)),
              ),
            ),
          );
        },
      ),
    );
  }
}
