import 'package:flutter/material.dart';
import '../widgets/top_bar.dart';
import '../widgets/player_stories.dart';
import '../widgets/match_list.dart';
import '../data/dummy_matches.dart';
import '../data/ligue1_matches.dart';
import '../data/laliga_matches.dart';
import '../data/bundesliga_matches.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 2;

  final List<Widget> _screens = [
    Center(child: Text("Stats")),
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text("UEFA Champions League", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          SizedBox(height: 8),
          MatchList(matches: dummyMatches),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Ligue 1", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          MatchList(matches: ligue1Matches),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("La Liga", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          MatchList(matches: laligaMatches),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text("Bundesliga", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          ),
          MatchList(matches: bundesligaMatches),

          SizedBox(height: 20),
        ],
      ),
    ),
  ),
),


    Center(child: Text("Prono'x")),
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
