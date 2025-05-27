import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  List<Map<String, dynamic>> matches = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadMatches();
  }

  Future<void> loadMatches() async {
    final data = await ApiService.getUpcomingMatches(leagueId: 61, season: 2023);
    setState(() {
      matches = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Text("Prochains matchs", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        ...matches.map((match) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Image.network(match['logoA'], height: 24),
              const SizedBox(width: 8),
              Text(match['teamA']),
              const Spacer(),
              Text(match['teamB']),
              const SizedBox(width: 8),
              Image.network(match['logoB'], height: 24),
            ],
          ),
        )),
      ],
    );
  }
}
