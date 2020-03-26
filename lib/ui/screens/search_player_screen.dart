import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_player.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/models/player.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_players.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/no_data.dart';

class SearchPlayerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocPlayer>(context);

    return Scaffold(
      appBar: MyAppBar(label: 'Rechercher un joueur'),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (String s) {
              bloc.fetchPlayers(name: s);
            },
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<List<Player>>(
                  stream: bloc.streamPlayer,
                  builder: (ctx, snap) {
                    if (snap == null || !snap.hasData) {
                      return NoData(
                        string: 'no data',
                      );
                    } else {
                      return ListPlayers(players: snap.data);
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
