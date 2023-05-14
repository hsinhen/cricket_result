class SeriesData {
  final String type;
  final List<SeriesModel> seriesList;

  SeriesData({
    required this.type,
    required this.seriesList,
  });

  factory SeriesData.fromJson(Map<String, dynamic> json) {
    return SeriesData(
      type: json['type'],
      seriesList: List<SeriesModel>.from(
        json['series'].map((series) => SeriesModel.fromJson(series)),
      ),
    );
  }
}

class SeriesModel {
  final int seriesId;
  final String seriesName;
  final String status;
  final String season;
  final String updatedAt;

  SeriesModel({
    required this.seriesId,
    required this.seriesName,
    required this.status,
    required this.season,
    required this.updatedAt,
  });

  factory SeriesModel.fromJson(Map<String, dynamic> json) {
    return SeriesModel(
      seriesId: json['series_id'],
      seriesName: json['series_name'],
      status: json['status'],
      season: json['season'],
      updatedAt: json['updated_at'],
    );
  }
}