class Match {
  final String teamA;
  final String teamB;
  final String logoA;
  final String logoB;
  final int scoreA;
  final int scoreB;
  final String status; // e.g. "FT", "LIVE", "18:00"

  const Match({
    required this.teamA,
    required this.teamB,
    required this.logoA,
    required this.logoB,
    required this.scoreA,
    required this.scoreB,
    required this.status,
  });
}
