import 'package:flutter/material.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_league.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_provider.dart';
import 'package:flutter_sports_rxdartbloc/blocs/bloc_sport.dart';
import 'package:flutter_sports_rxdartbloc/models/league.dart';
import 'package:flutter_sports_rxdartbloc/models/sport.dart';
import 'package:flutter_sports_rxdartbloc/models/team.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/home_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/league_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/search_player_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/search_team_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/sport_screen.dart';
import 'package:flutter_sports_rxdartbloc/ui/screens/team_screen.dart';

import 'bloc_player.dart';
import 'bloc_team.dart';

class BlocRouter {
  MaterialPageRoute sportDetail({@required Sport s}) =>
      MaterialPageRoute(builder: (ctx) => sport(sport: s));

  MaterialPageRoute leagueDetail({@required League l}) =>
      MaterialPageRoute(builder: (ctx) => league(league: l));

  MaterialPageRoute teamDetail({@required Team t}) =>
      MaterialPageRoute(builder: (ctx) => team(team: t));

  MaterialPageRoute playersData() =>
      MaterialPageRoute(builder: (ctx) => searchPlayer());

  MaterialPageRoute teamsData() =>
      MaterialPageRoute(builder: (ctx) => searchTeam());

  BlocProvider allSports() => BlocProvider<BlocSport>(
        bloc: BlocSport(),
        child: HomeScreen(title: 'Flutter Demo Home Page'),
      );

  BlocProvider sport({@required Sport sport}) => BlocProvider<BlocLeague>(
      bloc: BlocLeague(sport.name),
      child: SportScreen(
        sport: sport,
      ));

  BlocProvider league({@required League league}) => BlocProvider<BlocTeam>(
        bloc: BlocTeam.teams(id: league.id),
        child: LeagueScreen(league: league),
      );

  BlocProvider team({@required Team team}) => BlocProvider<BlocPlayer>(
      bloc: BlocPlayer(), child: TeamScreen(team: team));

  BlocProvider searchPlayer() => BlocProvider<BlocPlayer>(
        bloc: BlocPlayer(),
        child: SearchPlayerScreen(),
      );

  BlocProvider searchTeam() =>
      BlocProvider<BlocTeam>(bloc: BlocTeam.team(), child: SearchTeamScreen());
}
