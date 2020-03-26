import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_team.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_teams.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/no_data.dart';

class SearchTeamScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocTeam>(context);

    return Scaffold(
      appBar: MyAppBar(label: 'Rechercher un joueur'),
      body: Column(
        children: <Widget>[
          TextField(
            onChanged: (String s) {
              bloc.fetchTeam(name: s);
            },
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: StreamBuilder<List<Team>>(
                  stream: bloc.streamTeam,
                  builder: (ctx, snap) {
                    if (snap == null || !snap.hasData) {
                      return NoData(
                        string: 'no data',
                      );
                    } else {
                      return ListTeams(teams: snap.data);
                    }
                  }),
            ),
          )
        ],
      ),
    );
  }
}
