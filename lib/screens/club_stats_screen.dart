import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ClubStatsScreen extends StatefulWidget {
  final String clubName;
  final String logoPath;
  final int teamId;
  final int leagueId;

  const ClubStatsScreen({
    super.key,
    required this.clubName,
    required this.logoPath,
    required this.teamId,
    required this.leagueId,
  });

  @override
  State<ClubStatsScreen> createState() => _ClubStatsScreenState();
}

class _ClubStatsScreenState extends State<ClubStatsScreen> {
  int? wins;
  int? draws;
  int? losses;
  String? form;
  double? avgGoals;

  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchStats();
  }

  Future<void> fetchStats() async {
    final stats = await ApiService.getTeamStats(
      teamId: widget.teamId,
      leagueId: widget.leagueId,
      season: 2023,
    );

    setState(() {
      wins = stats?['fixtures']['wins']['total'];
      draws = stats?['fixtures']['draws']['total'];
      losses = stats?['fixtures']['loses']['total'];
      form = stats?['form'];
      avgGoals = double.tryParse(stats?['goals']['for']['average']['total'] ?? "0");
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.clubName)),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: [
                    Image.asset(widget.logoPath, height: 40),
                    const SizedBox(width: 12),
                    Text(widget.clubName, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  ]),
                  const SizedBox(height: 20),
                  Text("Forme récente : ${form ?? '-'}"),
                  const SizedBox(height: 8),
                  Text("Victoires : $wins"),
                  Text("Nuls : $draws"),
                  Text("Défaites : $losses"),
                  const SizedBox(height: 8),
                  Text("Moyenne de buts marqués : $avgGoals"),
                ],
              ),
            ),
    );
  }
}
