import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import '../score/score_page.dart';
import '../widgets/widgets.dart';
import 'result_controller.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage>
    with AutomaticKeepAliveClientMixin<ResultPage> {
  final ResultController _controller = Get.put(ResultController());

  @override
  void initState() {
    print('get result api');
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
              Color(0xFF333333),
              Color(0xFFdd1818),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            tileMode: TileMode.clamp,
          ),
        ),
        child: Center(
          child: Obx(
            () => _controller.dataList.isEmpty
                ? const CircularProgressIndicator()
                : ListView(
                    padding: const EdgeInsets.only(top: 75),
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                              Icon(
                                Icons.scoreboard,
                                color: Colors.white,
                                size: 30,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  'Result',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ],
                          ),
                          ResultContainer(
                            childData: _controller.dataList,
                            result: true,
                            onTap: (value) {
                              print(value);
                              Get.toNamed("/score", arguments: value);
                            },
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
