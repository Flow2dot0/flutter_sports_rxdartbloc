import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_player.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_router.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/search_player_screen.dart';

class ListMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListTile(
          title: Text('Rechercher un joueur'),
          onTap: () {
            Navigator.of(context).push(BlocRouter().playersData());
          },
        ),
        ListTile(
          title: Text('Rechercher une équipe'),
          onTap: () {
            Navigator.of(context).push(BlocRouter().teamsData());
          },
        ),
        ListTile(
          title: Text('Les évènements du jour'),
          onTap: () {},
        ),
        ListTile(
          title: Text('Rechercher des évènements sur une journée'),
          onTap: () {},
        ),
      ],
    );
  }
}
