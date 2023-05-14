import 'series_model.dart';
import 'team_model.dart';

class MatchResult {
  final MatchFixture? fixture;
  final LiveDetails? liveDetails;

  MatchResult({
    this.fixture,
    this.liveDetails,
  });

  factory MatchResult.fromJson(Map<String, dynamic> json) {
    return MatchResult(
      fixture: MatchFixture.fromJson(json['fixture'] as Map<String, dynamic>),
      liveDetails:
          LiveDetails.fromJson(json['live_details'] as Map<String, dynamic>),
    );
  }
}

class MatchFixture {
  final int id;
  final int seriesId;
  final String matchTitle;
  final String venue;
  final String startDate;
  final String endDate;
  final List<FixtureDate> dates;
  final Team home;
  final Team away;
  final SeriesModel series;

  MatchFixture({
    required this.id,
    required this.seriesId,
    required this.matchTitle,
    required this.venue,
    required this.startDate,
    required this.endDate,
    required this.dates,
    required this.home,
    required this.away,
    required this.series,
  });

  factory MatchFixture.fromJson(Map<String, dynamic> json) {
    return MatchFixture(
      id: json['id'] as int,
      seriesId: json['series_id'] as int,
      matchTitle: json['match_title'] as String,
      venue: json['venue'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      dates: (json['dates'] as List)
          .map((date) => FixtureDate.fromJson(date))
          .toList(),
      home: Team.fromJson(json['home']),
      away: Team.fromJson(json['away']),
      series: SeriesModel.fromJson(json['series']),
    );
  }
}

class FixtureDate {
  final String date;
  final String matchSubtitle;

  FixtureDate({
    required this.date,
    required this.matchSubtitle,
  });

  factory FixtureDate.fromJson(Map<String, dynamic> json) {
    return FixtureDate(
      date: json['date'] as String,
      matchSubtitle: json['match_subtitle'] as String,
    );
  }
}

class LiveDetails {
  final MatchSummary matchSummary;
  // final Officials officials;
  final List<ScoreCard> scorecard;
  // final Stats stats;
  // final Teamsheets teamsheets;

  LiveDetails({
    required this.matchSummary,
    // required this.officials,
    required this.scorecard,
    // required this.stats,
    // required this.teamsheets,
  });

  factory LiveDetails.fromJson(Map<String, dynamic> json) {
    return LiveDetails(
      matchSummary: MatchSummary.fromJson(json['match_summary']),
      // officials: Officials.fromJson(json['officials']),
      scorecard: List<ScoreCard>.from(
        json['scorecard'].map((series) => ScoreCard.fromJson(series)),
      ),
      // stats: Stats.fromJson(json['stats']),
      // teamsheets: Teamsheets.fromJson(json['teamsheets']),
    );
  }
}

class MatchSummary {
  final String inPlay;
  final String result;
  final String status;
  final String toss;
  final String homeScores;
  final String awayScores;

  MatchSummary({
    required this.inPlay,
    required this.result,
    required this.status,
    required this.toss,
    required this.homeScores,
    required this.awayScores,
  });

  factory MatchSummary.fromJson(Map<String, dynamic> json) {
    return MatchSummary(
      inPlay: json['in_play'] as String,
      result: json['result'] as String,
      status: json['status'] as String,
      toss: json['toss'] as String,
      homeScores: json['home_scores'] as String,
      awayScores: json['away_scores'] as String,
    );
  }
}

class Officials {
  String umpire1;
  String umpire2;
  String? umpireTV;
  String referee;
  String umpireReserve;

  Officials({
    required this.umpire1,
    required this.umpire2,
    required this.umpireTV,
    required this.referee,
    required this.umpireReserve,
  });

  factory Officials.fromJson(Map<String, dynamic> json) {
    return Officials(
      umpire1: json['umpire_1'],
      umpire2: json['umpire_2'],
      umpireTV: json['umpire_tv'],
      referee: json['referee'],
      umpireReserve: json['umpire_reserve'],
    );
  }
}

class Player {
  int batOrder;
  int playerId;
  String playerName;
  String howOut;
  String minutes;
  int runs;
  int balls;
  int fours;
  int sixes;
  String strikeRate;
  String position;

  Player({
    required this.batOrder,
    required this.playerId,
    required this.playerName,
    required this.howOut,
    required this.minutes,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
    required this.position,
  });

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(
      batOrder: json['bat_order'],
      playerId: json['player_id'],
      playerName: json['player_name'],
      howOut: json['how_out'],
      minutes: json['minutes'],
      runs: json['runs'],
      balls: json['balls'],
      fours: json['fours'],
      sixes: json['sixes'],
      strikeRate: json['strike_rate'],
      position: json['position'],
    );
  }
}

class ScoreCard {
  int? inningsNumber;
  // bool? current;
  String? title;
  // String? overs;
  // int? runs;
  // String? wickets;
  // int? extras;
  // String? extrasDetail;
  // String? fow;
  List<Batting>? batting;
  // List<Player>? stillToBat;
  // List<Bowling>? bowling;

  ScoreCard({
    this.inningsNumber,
    // this.current,
    this.title,
    // this.overs,
    // this.runs,
    // this.wickets,
    // this.extras,
    // this.extrasDetail,
    // this.fow,
    this.batting,
    // this.stillToBat,
    // this.bowling,
  });

  factory ScoreCard.fromJson(Map<String, dynamic> json) {
    // var list = json['batting'] as List;
    // List<Batting> battingList = list.map((i) => Batting.fromJson(i)).toList();

    // var stillToBatList = json['still_to_bat'] as List;
    // List<Player> stillToBat =
    //     stillToBatList.map((i) => Player.fromJson(i)).toList();

    // var bowlingList = json['bowling'] as List;
    // List<Bowling> bowling =
    //     bowlingList.map((i) => Bowling.fromJson(i)).toList();

    return ScoreCard(
      inningsNumber: json['innings_number'] as int?,
      // current: json['current'] as bool?,
      title: json['title'] as String?,
      // overs: json['overs'] as String?,
      // runs: json['runs'] as int?,
      // wickets: json['wickets'] as String?,
      // extras: json['extras'] as int?,
      // extrasDetail: json['extras_detail'] as String?,
      // fow: json['fow'] as String?,
      batting: List<Batting>.from(
        json['batting'].map((series) => Batting.fromJson(series)),
      ),
      // stillToBat: stillToBat,
      // bowling: bowling,
    );
  }
}

class Batting {
  int batOrder;
  int playerId;
  String playerName;
  String howOut;
  String minutes;
  int runs;
  int balls;
  int fours;
  int sixes;
  String strikeRate;

  Batting({
    required this.batOrder,
    required this.playerId,
    required this.playerName,
    required this.howOut,
    required this.minutes,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.strikeRate,
  });

  factory Batting.fromJson(Map<String, dynamic> json) {
    return Batting(
      batOrder: json['bat_order'],
      playerId: json['player_id'],
      playerName: json['player_name'],
      howOut: json['how_out'],
      minutes: json['minutes'],
      runs: json['runs'],
      balls: json['balls'],
      fours: json['fours'],
      sixes: json['sixes'],
      strikeRate: json['strike_rate'],
    );
  }
}

class Bowling {
  int playerId;
  String playerName;
  String overs;
  int maidens;
  int runsConceded;
  int wickets;
  String economy;
  int dotBalls;
  int fours;
  int sixes;
  String extras;

  Bowling({
    required this.playerId,
    required this.playerName,
    required this.overs,
    required this.maidens,
    required this.runsConceded,
    required this.wickets,
    required this.economy,
    required this.dotBalls,
    required this.fours,
    required this.sixes,
    required this.extras,
  });

  factory Bowling.fromJson(Map<String, dynamic> json) {
    return Bowling(
      playerId: json['player_id'],
      playerName: json['player_name'],
      overs: json['overs'],
      maidens: json['maidens'],
      runsConceded: json['runs_conceded'],
      wickets: json['wickets'],
      economy: json['economy'],
      dotBalls: json['dot_balls'],
      fours: json['fours'],
      sixes: json['sixes'],
      extras: json['extras'],
    );
  }
}

class Teamsheets {
  List<Player> home;
  List<Player> away;

  Teamsheets({
    required this.home,
    required this.away,
  });

  factory Teamsheets.fromJson(Map<String, dynamic> json) {
    var homeList = json['home'] as List;
    List<Player> home = homeList.map((i) => Player.fromJson(i)).toList();

    var awayList = json['away'] as List;
    List<Player> away = awayList.map((i) => Player.fromJson(i)).toList();

    return Teamsheets(
      home: home,
      away: away,
    );
  }
}
