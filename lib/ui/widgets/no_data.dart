import 'package:flutter/material.dart';

class NoData extends StatelessWidget {
  final String string;

  const NoData({Key key, this.string}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        string,
        style: TextStyle(
            color: Colors.teal, fontSize: 25.0, fontStyle: FontStyle.italic),
      ),
    );
  }
}
