import 'results_model.dart';
import 'series_model.dart';

class ResultSeriesModel {
  final SeriesModel series;
  final List<ResultModel> data;

  ResultSeriesModel({
    required this.series,
    required this.data,
  });
}
