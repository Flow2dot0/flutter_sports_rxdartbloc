import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/models/player.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' show json;

class SportsDbApi {
  final String _baseUrl = 'https://www.thesportsdb.com/api/v1/json/1/';

  String get _allSports => _baseUrl + 'all_sports.php';
  String _allLeagues(String name) =>
      _baseUrl + 'search_all_leagues.php?s=' + name;
  String _allTeamFromLeague(String id) =>
      _baseUrl + "lookup_all_teams.php?id=" + id;
  String _playerQuery(String text) => _baseUrl + "searchplayers.php?p=" + text;
  String _teamQuery(String name) => _baseUrl + "searchteams.php?t=" + name;
  String _eventQuery(String day) => _baseUrl + "eventsday.php?d=" + day;

  Future<List<dynamic>> request(String url, String key) async {
    try {
      final result = await http.get(url);
      final body = json.decode(result.body);
      return body[key];
    } catch (e) {
      print('request error : $e');
    }
  }

  Future fetchEvent(String day) async {}

  Future<List<Team>> fetchTeam(String name) async {
    final List<dynamic> l = await request(_teamQuery(name), 'teams');
    if (l != null) return l.map((json) => Team.fromJson(json)).toList();
  }

  Future<List<Player>> fetchPlayers(String name) async {
    final List<dynamic> l = await request(_playerQuery(name), 'player');
    if (l != null) return l.map((json) => Player.fromJson(json)).toList();
  }

  Future<List<League>> fetchLeagues(String name) async {
    final List<dynamic> l = await request(_allLeagues(name), 'countrys');
    return l.map((json) => League.fromJson(json)).toList();
  }

  Future<List<Team>> fetchTeams(String id) async {
    final List<dynamic> l = await request(_allTeamFromLeague(id), 'teams');
    return l.map((json) => Team.fromJson(json)).toList();
  }

  Future<List<Sport>> fetchSports() async {
    final List<dynamic> l = await request(_allSports, 'sports');
    return l.map((json) => Sport.fromJson(json)).toList();
  }
}
