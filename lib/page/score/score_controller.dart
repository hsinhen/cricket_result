import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../api/api_service.dart';
import '../../models/match_result_model.dart';
import '../../utils/utils.dart';

class ScoreController extends GetxController {
  Rx<MatchResult> data = MatchResult().obs;

  Future<void> fetchData(BuildContext context, String id) async {
    try {
      data.value = await ApiService.fetchMatchScoreBoard(id);
    } catch (e) {
      DialogUtils.showErrorDialog(context, e.toString());
    }
  }
}
