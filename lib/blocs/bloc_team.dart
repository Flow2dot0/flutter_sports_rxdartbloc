import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_base.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/services/sports_db_api.dart';
import 'package:rxdart/rxdart.dart';

class BlocTeam extends BlocBase {
  final BehaviorSubject<List<Team>> _subjectTeam =
      BehaviorSubject<List<Team>>();
  Stream<List<Team>> get streamTeam => _subjectTeam.stream;
  Sink<List<Team>> get sinkTeam => _subjectTeam.sink;

  fetchTeams({@required String id}) async {
    final teams = await SportsDbApi().fetchTeams(id);
    sinkTeam.add(teams);
  }

  fetchTeam({@required String name}) async {
    final team = await SportsDbApi().fetchTeam(name);
    sinkTeam.add(team);
  }

  BlocTeam.teams({@required String id}) {
    fetchTeams(id: id);
  }

  BlocTeam.team() {}

  @override
  void dispose() {
    _subjectTeam.close();
    super.dispose();
  }
}
