import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_router.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/team_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/icon_widget.dart';

class TileTeam extends StatelessWidget {
  final Team team;

  const TileTeam({Key key, this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        team.name,
        style: TextStyle(color: Colors.teal),
      ),
      leading: IconWidget(url: team.images.badge, size: 40.0),
      onTap: () {
        Navigator.of(context).push(BlocRouter().teamDetail(t: team));
      },
    );
  }
}
