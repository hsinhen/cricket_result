import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../models/results_model.dart';
import '../../utils/utils.dart';
import '../score/score_page.dart';

class ResultController extends GetxController {
  RxList<ResultModel> dataList = <ResultModel>[].obs;

  Future<void> fetchData(BuildContext context) async {
    try {
      dataList.value = await ApiService.fetchResult();
    } catch (e) {
      DialogUtils.showErrorDialog(context, e.toString());
    }
  }
}
