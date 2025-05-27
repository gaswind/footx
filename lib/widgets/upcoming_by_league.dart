import 'package:flutter/material.dart';
import '../services/api_service.dart';

class UpcomingByLeague extends StatefulWidget {
  final int leagueId;

  const UpcomingByLeague({super.key, required this.leagueId});

  @override
  State<UpcomingByLeague> createState() => _UpcomingByLeagueState();
}

class _UpcomingByLeagueState extends State<UpcomingByLeague> {
  List<Map<String, dynamic>> matches = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    load();
  }

  Future<void> load() async {
    final data = await ApiService.getUpcomingMatchesByLeague(widget.leagueId);
    setState(() {
      matches = data;
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (loading) return const Center(child: CircularProgressIndicator());

    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final m = matches[index];
          return Container(
            margin: const EdgeInsets.all(8),
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(children: [
                    Image.network(m['logoA'], height: 24),
                    const SizedBox(width: 6),
                    Expanded(child: Text(m['teamA'], style: const TextStyle(fontSize: 12))),
                  ]),
                  const SizedBox(height: 4),
                  Row(children: [
                    Image.network(m['logoB'], height: 24),
                    const SizedBox(width: 6),
                    Expanded(child: Text(m['teamB'], style: const TextStyle(fontSize: 12))),
                  ]),
                  const SizedBox(height: 4),
                  Text(m['date'].toString().substring(0, 10), style: const TextStyle(fontSize: 10)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
