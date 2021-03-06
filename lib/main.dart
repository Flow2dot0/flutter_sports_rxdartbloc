import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_router.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_sport.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocRouter().allSports(),
    );
  }
}
