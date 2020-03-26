import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_league.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_leagues.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/no_data.dart';

class SportScreen extends StatelessWidget {
  final Sport sport;

  const SportScreen({Key key, @required this.sport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final midHeight = MediaQuery.of(context).size.height / 2.5;
    final bloc = BlocProvider.of<BlocLeague>(context);

    return Scaffold(
      appBar: MyAppBar(label: sport.name),
      body: Column(
        children: <Widget>[detail(midHeight),
        Expanded(child: StreamBuilder<List<League>>(
            stream: bloc.streamLeague,
            builder: (ctx, snap){
              if(snap == null || !snap.hasData){
                return NoData(string: 'no data',);
              }else{
                return ListLeagues(leagues: snap.data);
              }
            }),),
        ],
      ),
    );
  }

  Container detail(double height) {
    return Container(
      height: height,
      child: Card(
        elevation: 7.5,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Image.network(sport.thumb),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(sport.desc),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
