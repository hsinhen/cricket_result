import 'package:flutter/material.dart';
import 'package:flutter_cricket/page/score/score_page.dart';
import 'package:get/get.dart';

import 'cricket_result_home_page.dart';

void main() {
  runApp(CricketResultApp());
}

class CricketResultApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CricketResultHomePage(),
      getPages: [
        GetPage(name: '/', page: () => const CricketResultHomePage()),
        GetPage(name: '/score', page: () => ScorePage()),
      ],
    );
  }
}
