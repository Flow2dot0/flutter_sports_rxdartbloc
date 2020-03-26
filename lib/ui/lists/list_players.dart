import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/models/player.dart';

class ListPlayers extends StatelessWidget {
  final List<Player> players;

  const ListPlayers({Key key, @required this.players}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: players.length,
        itemBuilder: (ctx, i) {
          return Row(
            children: <Widget>[
              players[i].images.thumb != null
                  ? Image.network(
                      players[i].images.thumb,
                      width: 50.0,
                    )
                  : Container(
                      width: 50.0,
                    ),
              Text(players[i].player)
            ],
          );
        });
  }
}
