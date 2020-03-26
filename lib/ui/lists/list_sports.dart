import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/ui/tiles/tile_sport.dart';

class ListSports extends StatelessWidget {
  final List<Sport> sports;

  const ListSports({Key key, this.sports}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: sports.length,
        itemBuilder: (ctx, i) {
          return TileSport(
            sport: sports[i],
          );
        });
  }
}
