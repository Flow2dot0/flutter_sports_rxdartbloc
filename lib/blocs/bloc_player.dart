import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_base.dart';
import 'package:flutter_sports_rxdartbloc/models/player.dart';
import 'package:flutter_sports_rxdartbloc/services/sports_db_api.dart';
import 'package:rxdart/rxdart.dart';

class BlocPlayer extends BlocBase {
  BehaviorSubject<List<Player>> _subjectPlayer =
      BehaviorSubject<List<Player>>();
  Stream<List<Player>> get streamPlayer => _subjectPlayer.stream;
  Sink<List<Player>> get sinkPlayer => _subjectPlayer.sink;

  fetchPlayers({@required String name}) async {
    final players = await SportsDbApi().fetchPlayers(name);
    sinkPlayer.add(players);
  }

  @override
  void dispose() {
    _subjectPlayer.close();
    super.dispose();
  }
}
