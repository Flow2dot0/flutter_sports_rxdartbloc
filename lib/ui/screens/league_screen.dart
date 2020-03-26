import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_team.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_teams.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/icon_widget.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/no_data.dart';

class LeagueScreen extends StatelessWidget {
  final League league;

  const LeagueScreen({Key key, @required this.league}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final midHeight = MediaQuery.of(context).size.height / 2.5;

    final bloc = BlocProvider.of<BlocTeam>(context);

    return Scaffold(
      appBar: MyAppBar(label: league.name),
      body: Column(
        children: <Widget>[
          detail(midHeight),
          Expanded(
            child: StreamBuilder<List<Team>>(
              stream: bloc.streamTeam,
              builder: (ctx, snap) {
                if (!snap.hasData || snap == null) {
                  return NoData(
                    string: 'no data',
                  );
                } else {
                  return ListTeams(teams: snap.data);
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Container detail(double height) {
    return Container(
      height: height,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            IconWidget(url: league.images.poster, size: 40.0),
            Text(league.description.english),
            Text(league.sport),
            Row(
              children: <Widget>[
                league.images.badge != null
                    ? IconWidget(url: league.images.badge, size: 20.0)
                    : Container(
                        height: 20,
                      ),
                league.images.banner != null
                    ? IconWidget(url: league.images.banner, size: 20.0)
                    : Container(
                        height: 20,
                      ),
                league.images.logo != null
                    ? IconWidget(url: league.images.logo, size: 20.0)
                    : Container(
                        height: 20,
                      ),
                league.images.trophy != null
                    ? IconWidget(url: league.images.trophy, size: 20.0)
                    : Container(
                        height: 20,
                      ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
