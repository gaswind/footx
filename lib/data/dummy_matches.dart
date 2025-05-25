import '../models/match.dart';

const List<Match> dummyMatches = [
  Match(
    teamA: "Real Madrid",
    teamB: "Man City",
    logoA: "assets/clubs/la_liga/real_madrid.png",
    logoB: "assets/clubs/premier_league/manchester_city.png",
    scoreA: 2,
    scoreB: 2,
    status: "FT",
  ),
  Match(
    teamA: "PSG",
    teamB: "Barça",
    logoA: "assets/clubs/ligue1/psg.png",
    logoB: "assets/clubs/la_liga/barca.png",
    scoreA: 3,
    scoreB: 1,
    status: "FT",
  ),
  Match(
    teamA: "Bayern",
    teamB: "Napoli",
    logoA: "assets/clubs/bundesliga/bayern.png",
    logoB: "assets/clubs/serie_a/napoli.png",
    scoreA: 1,
    scoreB: 1,
    status: "18:00",
  ),
];
