import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/icon_widget.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/my_app_bar.dart';
import 'package:flutter_sports_rxdartbloc/ui/widgets/separator.dart';

class TeamScreen extends StatelessWidget {
  final Team team;

  const TeamScreen({Key key, @required this.team}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(label: team.name),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                team.images.banner != null
                    ? IconWidget(url: team.images.banner, size: 20.0)
                    : Container(
                        height: 20,
                      ),
                IconWidget(url: team.images.badge, size: 20.0),
                Column(
                  children: <Widget>[
                    Text(team.name),
                    Text(team.sport),
                    Text(team.leagueName),
                  ],
                )
              ],
            ),
            Separator(),
            FlatButton(
                onPressed: () {},
                child: Text(
                  "Effectif",
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                )),
            Separator(),
            Column(
              children: <Widget>[
                Text(
                  'histoire',
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                ),
                Text(team.description.english),
              ],
            ),
            Separator(),
            Column(
              children: <Widget>[
                Text(
                  'stade',
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                ),
                Text(
                  team.stadium.name,
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                ),
                team.stadium.stadiumThumb != null
                    ? IconWidget(url: team.stadium.stadiumThumb, size: 20.0)
                    : Container(
                        height: 20,
                      ),
                Text(
                  team.stadium.stadiumDesc ?? '',
                  style: TextStyle(fontSize: 25.0, color: Colors.teal),
                ),
              ],
            ),
            Separator(),
            Column(
              children: fans(),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> fans() {
    List<Widget> l = [];
    team.images.fanArt.images.forEach((url) {
      l.add(IconWidget(url: url, size: 25.0));
    });

    return l;
  }
}
