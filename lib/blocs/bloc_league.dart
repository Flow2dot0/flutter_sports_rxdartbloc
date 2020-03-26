import 'package:flutter_sports_rxdartbloc/blocs/bloc_base.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/services/sports_db_api.dart';
import 'package:rxdart/rxdart.dart';

class BlocLeague extends BlocBase {

  final BehaviorSubject<List<League>> _subjectLeague = BehaviorSubject<List<League>>();
  Stream<List<League>> get streamLeague => _subjectLeague.stream;
  Sink<List<League>> get sinkLeague => _subjectLeague.sink;

  fetchLeagues(String name) async{
    final leagues = await SportsDbApi().fetchLeagues(name);
    sinkLeague.add(leagues);
  }

  BlocLeague(String name){
    fetchLeagues(name);
  }

  @override
  void dispose() {
    _subjectLeague.close();
    super.dispose();
  }

}
