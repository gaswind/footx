import 'package:flutter/material.dart';

import '../widgets/top_bar.dart';
import '../widgets/player_stories.dart';
import '../widgets/match_list.dart';
import '../widgets/ligue_header.dart';
import '../widgets/upcoming_matches.dart';
import '../widgets/upcoming_by_league.dart';
import '../data/dummy_matches.dart';
import '../data/ligue1_matches.dart';
import '../data/laliga_matches.dart';
import '../data/bundesliga_matches.dart';

import '../screens/stats_screen.dart';
import '../screens/prono_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const StatsScreen(),
    Center(child: Text("Actu'x")),
    SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              TopBar(),
              SizedBox(height: 10),
              PlayerStories(),
              SizedBox(height: 10),

              LigueHeader(logoPath: 'assets/ucl.png', title: "UEFA Champions League"),
              UpcomingByLeague(leagueId: 2),

              LigueHeader(logoPath: 'assets/ligue1.png', title: "Ligue 1"),
              UpcomingByLeague(leagueId: 61),

              LigueHeader(logoPath: 'assets/laliga.png', title: "La Liga"),
              UpcomingByLeague(leagueId: 140),

              LigueHeader(logoPath: 'assets/bundesliga.png', title: "Bundesliga"),
              UpcomingByLeague(leagueId: 78),

              SizedBox(height: 16),
              UpcomingMatches(),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),
    const PronoScreen(),
    Center(child: Text("Profil")),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Actu\'x'),
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset), label: 'Prono\'x'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        backgroundColor: Color(0xFF1E1E1E),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
