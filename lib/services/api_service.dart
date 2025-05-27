import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const _baseUrl = 'https://v3.football.api-sports.io';
  static const _apiKey = '1517ec667f622dfcbbd41fff4295380e';

  // 📊 Récupérer les stats d’un club
  static Future<Map<String, dynamic>?> getTeamStats({
    required int teamId,
    required int leagueId,
    required int season,
  }) async {
    final url = Uri.parse('$_baseUrl/teams/statistics?team=$teamId&season=$season&league=$leagueId');

    final response = await http.get(
      url,
      headers: {
        'x-apisports-key': _apiKey,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body)['response'];
    } else {
      print("Erreur API: ${response.statusCode}");
      return null;
    }
  }

  // 🗓️ Prochains matchs globaux (toutes ligues confondues)
  static Future<List<Map<String, dynamic>>> getUpcomingMatches({
    required int leagueId,
    required int season,
    int count = 5,
  }) async {
    final now = DateTime.now().toIso8601String();
    final url = Uri.parse(
      '$_baseUrl/fixtures?league=$leagueId&season=$season&from=$now&sort=asc',
    );

    final response = await http.get(
      url,
      headers: {'x-apisports-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List list = decoded['response'];
      return list.take(count).map((m) {
        return {
          'teamA': m['teams']['home']['name'],
          'teamB': m['teams']['away']['name'],
          'logoA': m['teams']['home']['logo'],
          'logoB': m['teams']['away']['logo'],
          'date': m['fixture']['date'],
        };
      }).toList();
    } else {
      print("Erreur API: ${response.statusCode}");
      return [];
    }
  }

  // 🏆 Prochains matchs d’une ligue spécifique
  static Future<List<Map<String, dynamic>>> getUpcomingMatchesByLeague(int leagueId) async {
    final now = DateTime.now().toIso8601String();
    final url = Uri.parse(
      '$_baseUrl/fixtures?league=$leagueId&season=2023&from=$now&sort=asc',
    );

    final response = await http.get(
      url,
      headers: {'x-apisports-key': _apiKey},
    );

    if (response.statusCode == 200) {
      final decoded = json.decode(response.body);
      final List list = decoded['response'];
      return list.map((m) {
        return {
          'teamA': m['teams']['home']['name'],
          'teamB': m['teams']['away']['name'],
          'logoA': m['teams']['home']['logo'],
          'logoB': m['teams']['away']['logo'],
          'date': m['fixture']['date'],
        };
      }).toList();
    } else {
      print("Erreur API: ${response.statusCode}");
      return [];
    }

  }
}
