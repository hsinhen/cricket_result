import 'package:flutter_cricket/models/results_model.dart';
import 'package:get/get.dart';
import '../../api/api_service.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

import '../../models/results_series_model.dart';
import '../../models/series_model.dart';
import '../../utils/utils.dart';

class FixturesController extends GetxController {
  RxList<ResultModel> dataList = <ResultModel>[].obs;
  RxList<SeriesModel> seriesList = <SeriesModel>[].obs;
  RxList<ResultSeriesModel> finalData = <ResultSeriesModel>[].obs;

  Future<void> fetchData(BuildContext context) async {
    try {
      print('calling api');
      dataList.value = await ApiService.fetchFixtures();
      seriesList.value = await ApiService.fetchSeries();
      finalData.value = groupData();
    } catch (e) {
      DialogUtils.showErrorDialog(context, e.toString());
    }
  }

  List<ResultSeriesModel> groupData() {
    return seriesList
        .map((modal1) {
          List<ResultModel> data = dataList
              .where((modal2) => modal2.seriesId == modal1.seriesId)
              .toList();
          return ResultSeriesModel(series: modal1, data: data);
        })
        .where((modal3) => modal3.data.isNotEmpty)
        .toList();
  }
}
