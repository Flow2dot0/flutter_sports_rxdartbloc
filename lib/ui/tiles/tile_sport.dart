import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_router.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';

class TileSport extends StatelessWidget {
  final Sport sport;

  const TileSport({Key key, this.sport}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          Navigator.of(context).push(BlocRouter().sportDetail(s: sport)),
      child: Card(
        color: Colors.teal,
        elevation: 7.5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              sport.name,
              style: TextStyle(
                fontSize: 25.0,
                fontStyle: FontStyle.italic,
                color: Colors.white,
              ),
            ),
            Image.network(
              sport.thumb,
              width: MediaQuery.of(context).size.width / 2.5,
            )
          ],
        ),
      ),
    );
  }
}
