import 'package:flutter_sports_rxdartbloc/blocs/bloc_base.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/services/sports_db_api.dart';
import 'package:rxdart/rxdart.dart';

class BlocSport extends BlocBase {
  final BehaviorSubject<List<Sport>> _subjectSport =
      BehaviorSubject<List<Sport>>();
  Stream<List<Sport>> get streamSport => _subjectSport.stream;
  Sink<List<Sport>> get sinkSport => _subjectSport.sink;

  fetchSports() async {
    final sports = await SportsDbApi().fetchSports();
    sinkSport.add(sports);
  }

  BlocSport() {
    fetchSports();
  }

  @override
  void dispose() {
    _subjectSport.close();
    super.dispose();
  }
}
