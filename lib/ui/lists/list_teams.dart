import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/tiles/tile_team.dart';

class ListTeams extends StatelessWidget {
  final List<Team> teams;

  const ListTeams({Key key, @required this.teams}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemBuilder: (ctx, i) => TileTeam(
              team: teams[i],
            ),
        separatorBuilder: (ctx, i) => Divider(),
        itemCount: teams.length);
  }
}
