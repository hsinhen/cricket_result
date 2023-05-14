import 'package:flutter/material.dart';

import '../../models/results_model.dart';
import '../../utils/utils.dart';

class ResultContainer extends StatefulWidget {
  final List<ResultModel> childData;
  final bool result;
  final ValueChanged<String> onTap;
  const ResultContainer({
    super.key,
    required this.childData,
    required this.result,
    required this.onTap,
  });

  @override
  State<ResultContainer> createState() => _ResultContainerState();
}

class _ResultContainerState extends State<ResultContainer> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.childData.length,
      itemBuilder: (context, index) {
        final data = widget.childData[index];            
        return GestureDetector(
          onTap: () {
            widget.onTap(data.id.toString());
          },
          child: Container(
            margin: const EdgeInsets.only(bottom: 20, left: 35, right: 35),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 7,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                if (widget.result)
                  Text(
                    data.result,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                    ),
                    textAlign: TextAlign.center,
                  ),
                if (widget.result) const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.flag_circle,
                            color: randomColor(),
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.home.name,
                            style: TextStyle(
                                fontWeight: containsAnyWord(
                                            data.result, data.home.name) &&
                                        widget.result
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                fontSize: 13,
                                color: containsAnyWord(
                                            data.result, data.home.name) &&
                                        widget.result
                                    ? const Color.fromARGB(255, 58, 157, 61)
                                    : Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        children: [
                          Text(
                            convertToLocalTime(data.date, 'HH:mm'),
                            style: const TextStyle(
                              color: Colors.red,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            convertToLocalTime(data.date, 'd MMM'),
                            style: const TextStyle(
                              color: Color.fromARGB(255, 76, 76, 76),
                              fontSize: 15,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          Icon(
                            Icons.flag_circle,
                            color: randomColor(),
                            size: 40,
                          ),
                          const SizedBox(height: 10),
                          Text(
                            data.away.name,
                            style: TextStyle(
                                fontWeight: containsAnyWord(
                                            data.result, data.away.name) &&
                                        widget.result
                                    ? FontWeight.w700
                                    : FontWeight.w500,
                                fontSize: 13,
                                color: containsAnyWord(
                                            data.result, data.away.name) &&
                                        widget.result
                                    ? const Color.fromARGB(255, 58, 157, 61)
                                    : Colors.black),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  data.venue,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
