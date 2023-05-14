import 'dart:convert';

import 'package:flutter_cricket/models/match_result_model.dart';
import 'package:http/http.dart' as http;

import '../models/results_model.dart';
import '../models/series_model.dart';

class ApiService {
  static const String _baseUrl = 'https://cricket-live-data.p.rapidapi.com';
  static const Map<String, String> _headers = {
    'X-RapidAPI-Key': '6c29ba2b9emshc1b18ac7a2eb3e7p145c8djsnb92a8ac16442',
    'X-RapidAPI-Host': 'cricket-live-data.p.rapidapi.com',
  };

  static final ApiService _instance = ApiService._internal();

  factory ApiService() {
    return _instance;
  }

  ApiService._internal();

  //API Function
  static Future<dynamic> get(String endpoint) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/$endpoint'),
      headers: _headers,
    );
    if (response.statusCode == 200) {
      return response.body;
    } else {
      Map<String, dynamic> jsonMap = jsonDecode(response.body);
      String message = jsonMap['message'];

      throw Exception(message);
    }
  }

  static Future<List<SeriesModel>> fetchSeries() async {
    final response = await get('series');
    final jsonResponse = (json.decode(response))['results'] as List<dynamic>;
    List<SeriesData> data =
        jsonResponse.map((json) => SeriesData.fromJson(json)).toList();
    List<SeriesModel> newData = data.fold(
        [], (previousValue, element) => previousValue + element.seriesList);
    return newData;
  }

  static Future<List<ResultModel>> fetchFixtures() async {
    final response = await get('fixtures');
    final jsonResponse = (json.decode(response))['results'] as List<dynamic>;
    return jsonResponse.map((json) => ResultModel.fromJson(json)).toList();
  }

  static Future<List<ResultModel>> fetchFixturesBySeries(String series) async {
    final response = await get('fixtures-by-series/$series');
    final responseJson = response['results'] as List<dynamic>;
    return responseJson.map((json) => ResultModel.fromJson(json)).toList();
  }

  static Future<List<ResultModel>> fetchFixturesByDate(String date) async {
    final response = await get('fixtures-by-date/$date');
    final responseJson = response['results'] as List<dynamic>;
    return responseJson.map((json) => ResultModel.fromJson(json)).toList();
  }

  static Future<List<ResultModel>> fetchResult() async {
    final response = await get('results');
    final jsonResponse = (json.decode(response))['results'] as List<dynamic>;
    return jsonResponse.map((json) => ResultModel.fromJson(json)).toList();
  }

  static Future<List<ResultModel>> fetchResultByDate(String date) async {
    final response = await get('results-by-date/$date');
    final responseJson = response['results'] as List<dynamic>;
    return responseJson.map((json) => ResultModel.fromJson(json)).toList();
  }

  static Future<MatchResult> fetchMatchScoreBoard(String id) async {
    final response = await get('match/$id');
    Map<String, dynamic> jsonMap = jsonDecode(response);
    MatchResult responseModel =
        MatchResult.fromJson(jsonMap['results'] as Map<String, dynamic>);

    return responseModel;
  }
}
