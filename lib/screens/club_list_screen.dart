import 'package:flutter/material.dart';
import 'club_stats_screen.dart';

class ClubListScreen extends StatelessWidget {
  final Map<String, String> leagueLogos = const {
    'Ligue 1': 'assets/leagues/ligue1.png',
    'Bundesliga': 'assets/leagues/bundesliga.png', // Correction ici
    'Premier League': 'assets/leagues/premier_league.png',
    'La Liga': 'assets/leagues/la_liga.png',
    'Serie A': 'assets/leagues/serie_a.png',
    'Eredivisie': 'assets/leagues/eredivisie.png',
  };
  final String leagueName;
  const ClubListScreen({super.key, required this.leagueName});

  @override
  Widget build(BuildContext context) {
    final clubs = {
      'Ligue 1': [
        {'name': 'PSG', 'logo': 'assets/clubs/ligue1/psg.png'},
        {'name': 'OM', 'logo': 'assets/clubs/ligue1/om.png'},
        {'name': 'OL', 'logo': 'assets/clubs/ligue1/ol.png'},
        {'name': 'RC Lens', 'logo': 'assets/clubs/ligue1/lens.png'},
        {'name': 'Toulouse', 'logo': 'assets/clubs/ligue1/toulouse.png'},
        {'name': 'RC Strasbourg', 'logo': 'assets/clubs/ligue1/strasbourg.png'},
      ],
      'Bundesliga': [
        {'name': 'Bayern Munich', 'logo': 'assets/clubs/bundesliga/bayern.png'},
        {'name': 'Borussia Dortmund', 'logo': 'assets/clubs/bundesliga/dortmund.png'},
        {'name': 'RB Leipzig', 'logo': 'assets/clubs/bundesliga/leipzig.png'},
        {'name': 'Bayer Leverkusen', 'logo': 'assets/clubs/bundesliga/leverkusen.png'},
        {'name': 'VfL Wolfsburg', 'logo': 'assets/clubs/bundesliga/wolfsburg.png'},
        {'name': 'Eintracht Frankfurt', 'logo': 'assets/clubs/bundesliga/frankfurt.png'},
      ],
      'Premier League': [
        {'name': 'Manchester City', 'logo': 'assets/clubs/premier_league/manchester_city.png'},
        {'name': 'Liverpool', 'logo': 'assets/clubs/premier_league/liverpool.png'},
        {'name': 'Chelsea', 'logo': 'assets/clubs/premier_league/chelsea.png'},
        {'name': 'Arsenal', 'logo': 'assets/clubs/premier_league/arsenal.png'},
        {'name': 'Tottenham Hotspur', 'logo': 'assets/clubs/premier_league/tottenham.png'},
        {'name': 'Manchester United', 'logo': 'assets/clubs/premier_league/manchester_united.png'},
      ],
      'La Liga': [
        {'name': 'Real Madrid', 'logo': 'assets/clubs/la_liga/real_madrid.png'},
        {'name': 'FC Barcelona', 'logo': 'assets/clubs/la_liga/barca.png'},
        {'name': 'Atletico Madrid', 'logo': 'assets/clubs/la_liga/atletico.png'},
        {'name': 'Sevilla FC', 'logo': 'assets/clubs/la_liga/seville.png'},
        {'name': 'Real Betis', 'logo': 'assets/clubs/la_liga/real_betis.png'},
        {'name': 'Valencia CF', 'logo': 'assets/clubs/la_liga/valencia.png'},
      ],
      'Serie A': [
        {'name': 'Juventus', 'logo': 'assets/clubs/serie_a/juventus.png'},
        {'name': 'AC Milan', 'logo': 'assets/clubs/serie_a/ac_milan.png'},
        {'name': 'Inter Milan', 'logo': 'assets/clubs/serie_a/inter_milan.png'},
        {'name': 'AS Roma', 'logo': 'assets/clubs/serie_a/as_roma.png'},
        {'name': 'Napoli', 'logo': 'assets/clubs/serie_a/napoli.png'},
        {'name': 'Lazio', 'logo': 'assets/clubs/serie_a/lazio.png'},
      ],
      'Eredivisie': [
        {'name': 'Ajax', 'logo': 'assets/clubs/eredivisie/ajax.png'},
        {'name': 'PSV Eindhoven', 'logo': 'assets/clubs/eredivisie/psv.png'},
        {'name': 'Feyenoord', 'logo': 'assets/clubs/eredivisie/feyenoord.png'},
        {'name': 'AZ Alkmaar', 'logo': 'assets/clubs/eredivisie/az_alkmaar.png'},
        {'name': 'Vitesse', 'logo': 'assets/clubs/eredivisie/vitesse.png'},
        {'name': 'FC Utrecht', 'logo': 'assets/clubs/eredivisie/fc_utrecht.png'},
      ],
    };

    final selectedClubs = clubs[leagueName] ?? [];
    final leagueLogo = leagueLogos[leagueName];

    return Scaffold(
      appBar: AppBar(title: Text(leagueName)),
      body: Column(
        children: [
          if (leagueLogo != null)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Image.asset(
                leagueLogo,
                height: 64,
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: selectedClubs.length,
              itemBuilder: (context, index) {
                final club = selectedClubs[index];
                return GestureDetector(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ClubStatsScreen(
                        clubName: club['name']!,
                        logoPath: club['logo']!,
                      ),
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
          ),
        ],
      ),
    );
  }
}
