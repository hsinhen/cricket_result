import 'package:flutter/material.dart';
import 'package:flutter_cricket/page/fixtures/fixtures_controller.dart';
import 'package:get/get.dart';
import 'dart:math' as math;

import '../../utils/utils.dart';
import '../widgets/widgets.dart';

class FixturesPage extends StatefulWidget {
  const FixturesPage({super.key});

  @override
  State<FixturesPage> createState() => _FixturesPageState();
}

class _FixturesPageState extends State<FixturesPage>
    with AutomaticKeepAliveClientMixin<FixturesPage> {
  final FixturesController _controller = Get.put(FixturesController());

  @override
  void initState() {
    print('get fixtures api');
    _controller.fetchData(context);
    super.initState();
  }

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0f0c29),
              Color(0xFF302b63),
              Color(0xFF24243e),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Obx(
            () => _controller.finalData.isEmpty
                ? const CircularProgressIndicator()
                : ListView(
                    children: [
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        itemCount: _controller.finalData.length,
                        itemBuilder: (context, index) {
                          final data = _controller.finalData[index];
                          final childData = data.data;
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 40),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Icon(
                                          Icons.sports_cricket_rounded,
                                          color: Colors.white,
                                          size: 20,
                                        ),
                                        const SizedBox(width: 10),
                                        Flexible(
                                          child: Text(
                                            data.series.seriesName,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 5),
                                    Text(
                                      'season ${data.series.season}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              ),
                              ResultContainer(
                                childData: _controller.dataList,
                                result: false,
                                onTap: (value) {},
                              ),
                            ],
                          );
                        },
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
