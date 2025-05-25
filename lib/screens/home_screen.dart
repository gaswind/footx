import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/player_stories.dart';
import '../widgets/match_list.dart';
import '../widgets/ligue_header.dart';
import '../data/dummy_matches.dart';
import '../data/ligue1_matches.dart';
import '../data/laliga_matches.dart';
import '../data/bundesliga_matches.dart';
import '../screens/stats_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    const StatsScreen(), // onglet 0
    Center(child: Text("Actu'x")), // onglet 1

    // Onglet Accueil (index 2)
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

              LigueHeader(logoPath: 'assets/leagues/ucl.png', title: "UEFA Champions League"),
              MatchList(matches: dummyMatches),

              LigueHeader(logoPath: 'assets/leagues/ligue1.png', title: "Ligue 1"),
              MatchList(matches: ligue1Matches),

              LigueHeader(logoPath: 'assets/leagues/laliga.png', title: "La Liga"),
              MatchList(matches: laligaMatches),

              LigueHeader(logoPath: 'assets/leagues/bundesliga.png', title: "Bundesliga"),
              MatchList(matches: bundesligaMatches),

              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    ),

    Center(child: Text("Prono'x")), // onglet 3
    Center(child: Text("Profil")),  // onglet 4
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
