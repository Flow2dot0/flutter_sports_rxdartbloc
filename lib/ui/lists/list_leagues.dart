import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/ui/tiles/tile_league.dart';

class ListLeagues extends StatelessWidget {

  final List<League> leagues;

  const ListLeagues({Key key, @required this.leagues}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (ctx, i) => TileLeague(league: leagues[i]),
        separatorBuilder: (ctx, i) => Divider(),
      itemCount: leagues.length,
    );
  }
}
