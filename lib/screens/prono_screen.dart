import 'package:flutter/material.dart';

class PronoScreen extends StatefulWidget {
  const PronoScreen({super.key});

  @override
  State<PronoScreen> createState() => _PronoScreenState();
}

class _PronoScreenState extends State<PronoScreen> {
  final List<Map<String, dynamic>> matches = [
    {'teamA': 'PSG', 'teamB': 'OM', 'logoA': 'assets/clubs/ligue1/psg.png', 'logoB': 'assets/clubs/ligue1/om.png'},
    {'teamA': 'Barça', 'teamB': 'Real Madrid', 'logoA': 'assets/clubs/la_liga/barca.png', 'logoB': 'assets/clubs/la_liga/real_madrid.png'},
    {'teamA': 'Bayern', 'teamB': 'Dortmund', 'logoA': 'assets/clubs/bundesliga/bayern.png', 'logoB': 'assets/clubs/bundesliga/dortmund.png'},
  ];

  final Map<int, List<int>> predictions = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prono'x")),
      body: ListView.builder(
        itemCount: matches.length,
        itemBuilder: (context, index) {
          final match = matches[index];
          final scoreA = predictions[index]?[0] ?? 0;
          final scoreB = predictions[index]?[1] ?? 0;

          return Card(
            margin: const EdgeInsets.all(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.asset(match['logoA'], height: 32),
                      const SizedBox(width: 8),
                      Expanded(child: Text(match['teamA'])),
                      const Text("VS"),
                      Expanded(child: Text(match['teamB'], textAlign: TextAlign.right)),
                      const SizedBox(width: 8),
                      Image.asset(match['logoB'], height: 32),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _scoreField(index, 0, scoreA),
                      const SizedBox(width: 12),
                      _scoreField(index, 1, scoreB),
                    ],
                  ),
                  const SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () {
                      final a = predictions[index]?[0] ?? 0;
                      final b = predictions[index]?[1] ?? 0;
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Pronostic : ${match['teamA']} $a - $b ${match['teamB']}"),
                      ));
                    },
                    child: const Text("Valider"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _scoreField(int matchIndex, int teamIndex, int initialValue) {
    return SizedBox(
      width: 50,
      child: TextFormField(
        initialValue: initialValue.toString(),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: const InputDecoration(
          border: OutlineInputBorder(),
        ),
        onChanged: (val) {
          setState(() {
            final a = predictions[matchIndex] ?? [0, 0];
            a[teamIndex] = int.tryParse(val) ?? 0;
            predictions[matchIndex] = a;
          });
        },
      ),
    );
  }
}
