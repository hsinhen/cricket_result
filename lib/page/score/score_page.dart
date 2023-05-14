import 'package:flutter/material.dart';
import 'package:flutter_cricket/models/match_result_model.dart';
import 'package:get/get.dart';

import '../../utils/utils.dart';
import 'score_controller.dart';

class ScorePage extends StatefulWidget {
  const ScorePage({super.key});

  @override
  State<ScorePage> createState() => _ScorePageState();
}

class _ScorePageState extends State<ScorePage> {
  final ScoreController _controller = Get.put(ScoreController());

  @override
  void initState() {
    final value = Get.arguments as String;
    _controller.fetchData(context, value);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF0f0c29),
                  Color(0xFF302b63),
                  Color(0xFF24243e),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                tileMode: TileMode.clamp,
              ),
              boxShadow: const [BoxShadow(blurRadius: 40.0)],
              borderRadius: BorderRadius.vertical(
                  bottom: Radius.elliptical(
                      MediaQuery.of(context).size.width, 100.0)),
            ),
            child: AppBar(
              backgroundColor: Colors.transparent,
              shadowColor: Colors.transparent,
              centerTitle: true,
              title: const Text('Full Scoreboard'),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                ),
              ],
            ),
            margin: const EdgeInsets.only(
                top: 100, left: 20, right: 20, bottom: 20),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
            child: Obx(() => _controller.data.value.fixture == null
                ? const CircularProgressIndicator()
                : ListView(
                    children: [
                      Column(
                        children: [
                          Text(
                            '${_controller.data.value.fixture!.dates.first.matchSubtitle}, ${_controller.data.value.fixture!.series.seriesName}, ${convertToLocalTime(_controller.data.value.fixture!.dates.first.date, 'dd MMM, yyyy')}',
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                              fontSize: 15,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 10),
                          participantWidget(true),
                          const SizedBox(height: 10),
                          participantWidget(false),
                          const SizedBox(height: 15),
                          titleWidget('Result'),
                          Row(
                            children: [
                              Text(
                                _controller.data.value.liveDetails!.matchSummary
                                    .status,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          const SizedBox(height: 15),
                          titleWidget('Scoreboard'),
                          const SizedBox(height: 5),
                          scoreboardWidget(),
                        ],
                      ),
                    ],
                  )),
          )
        ],
      ),
    );
  }

  Widget titleWidget(String title) {
    return Row(
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget participantWidget(bool home) {
    return Row(
      children: [
        Icon(
          Icons.flag_circle,
          color: randomColor(),
          size: 40,
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              home ? 'Home' : 'Away',
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black,
              ),
            ),
            Text(
              home
                  ? _controller.data.value.fixture!.home.name
                  : _controller.data.value.fixture!.away.name,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            Text(
              home
                  ? _controller.data.value.liveDetails!.matchSummary.homeScores
                  : _controller.data.value.liveDetails!.matchSummary.awayScores,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget scoreboardWidget() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: _controller.data.value.liveDetails!.scorecard.length,
      itemBuilder: ((context, index) {
        ScoreCard scoreboardData =
            _controller.data.value.liveDetails!.scorecard[index];
        return Column(
          children: [
            Row(
              children: [
                Text(
                  '${scoreboardData.title} Batting',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              children: [
                scoreCardWidget(),
                scoreCardWidget(text: 'R', bold: true),
                scoreCardWidget(text: 'B', bold: true),
                scoreCardWidget(text: '4s', bold: true),
                scoreCardWidget(text: '6s', bold: true),
                scoreCardWidget(text: 'SR', bold: true),
              ],
            ),
            if (scoreboardData.batting != null)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: scoreboardData.batting!.length,
                itemBuilder: (context, index) {
                  Batting battingData = scoreboardData.batting![index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4),
                    child: Row(
                      children: [
                        scoreCardWidget(text: battingData.playerName),
                        scoreCardWidget(text: battingData.runs.toString()),
                        scoreCardWidget(text: battingData.balls.toString()),
                        scoreCardWidget(text: battingData.fours.toString()),
                        scoreCardWidget(text: battingData.sixes.toString()),
                        scoreCardWidget(
                            text: battingData.strikeRate.toString()),
                      ],
                    ),
                  );
                },
              ),
            const SizedBox(height: 15),
          ],
        );
      }),
    );
  }

  Widget scoreCardWidget({String text = '', bool bold = false}) {
    return Expanded(
      flex: text.length > 6 || text == '' ? 3 : 1,
      child: Text(
        text,
        style:
            TextStyle(fontWeight: bold ? FontWeight.w600 : FontWeight.normal),
        maxLines: 2,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
