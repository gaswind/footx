import 'package:flutter/material.dart';
import 'club_stats_screen.dart';

class ClubListScreen extends StatelessWidget {
  final String leagueName;
  const ClubListScreen({super.key, required this.leagueName});

  @override
  Widget build(BuildContext context) {
    final Map<String, List<Map<String, dynamic>>> clubs = {
      'Ligue 1': [
        {
          'name': 'PSG',
          'logo': 'assets/clubs/ligue1/psg.png',
          'id': 85, // ID officiel de PSG dans l’API-Football
        },
        {
          'name': 'OM',
          'logo': 'assets/clubs/ligue1/om.png',
          'id': 81,
        },
        {
          'name': 'OL',
          'logo': 'assets/clubs/ligue1/lyon.png',
          'id': 80,
        },
        {
          'name': 'Lens',
          'logo': 'assets/clubs/ligue1/lens.png',
          'id': 116,
        },
      ],
      // Tu peux ajouter ici 'Liga': [...] avec d'autres clubs
    };

    final selectedClubs = clubs[leagueName] ?? [];
    final leagueId = getLeagueId(leagueName);

    return Scaffold(
      appBar: AppBar(title: Text(leagueName)),
      body: ListView.builder(
        itemCount: selectedClubs.length,
        itemBuilder: (context, index) {
          final club = selectedClubs[index];
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListTile(
              leading: Image.asset(club['logo'], height: 32),
              title: Text(club['name'], style: const TextStyle(fontSize: 18)),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => ClubStatsScreen(
                      clubName: club['name'],
                      logoPath: club['logo'],
                      teamId: club['id'],
                      leagueId: leagueId,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  int getLeagueId(String leagueName) {
    switch (leagueName) {
      case 'Ligue 1':
        return 61;
      case 'Liga':
        return 140;
      case 'Bundesliga':
        return 78;
      case 'Serie A':
        return 135;
      case 'Premier League':
        return 39;
      default:
        return 0;
    }
  }
}
