import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_sport.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/services/sports_db_api.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_menu.dart';
import 'package:flutter_sports_rxdartbloc/ui/lists/list_sports.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/no_data.dart';

class HomeScreen extends StatelessWidget {
  final String title;

  const HomeScreen({Key key, @required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<BlocSport>(context);
    final height = MediaQuery.of(context).size.height / 5;
    return Scaffold(
        appBar: MyAppBar(label: 'I ❤️ sports'),
        body: Column(
          children: <Widget>[
            Image.asset(
              'app_assets/images/sports.jpg',
              height: height,
            ),
            Expanded(
              child: Container(
                child: ListMenu(),
              ),
            ),
            Container(
              height: height,
              child: StreamBuilder<List<Sport>>(
                  stream: bloc.streamSport,
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return NoData(
                        string: 'no data',
                      );
                    } else {
                      return ListSports(
                        sports: snapshot.data,
                      );
                    }
                  }),
            ),
          ],
        ));
  }
}
