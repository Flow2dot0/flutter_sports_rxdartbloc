import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_router.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/icon_widget.dart';

class TileLeague extends StatelessWidget {
  final League league;

  const TileLeague({Key key, @required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(league.name),
      leading: IconWidget(
        url: league.images.badge,
        size: 40.0,
      ),
      onTap: () =>
          Navigator.of(context).push(BlocRouter().leagueDetail(l: league)),
    );
  }
}
