import 'package:flutter_cricket/models/team_model.dart';

class ResultModel {
  final int id;
  final int seriesId;
  final String venue;
  final String date;
  final String status;
  final String result;
  final String matchTitle;
  final String matchSubtitle;
  final Team home;
  final Team away;

  ResultModel({
    required this.id,
    required this.seriesId,
    required this.venue,
    required this.date,
    required this.status,
    required this.result,
    required this.matchTitle,
    required this.matchSubtitle,
    required this.home,
    required this.away,
  });

  factory ResultModel.fromJson(Map<String, dynamic> json) {
    return ResultModel(
      id: json['id'] as int,
      seriesId: json['series_id'] as int,
      venue: json['venue'] as String,
      date: json['date'] as String,
      status: json['status'] as String,
      result: json['result'] as String,
      matchTitle: json['match_title'] as String,
      matchSubtitle: json['match_subtitle'] as String,
      home: Team.fromJson(json['home']),
      away: Team.fromJson(json['away']),
    );
  }
}
