import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'dart:math' as math;

String convertToLocalTime(String dateTimeString, String format) {
  final utcDateTime = DateTime.parse(dateTimeString);
  final timeFormat =  DateFormat(format);//DateFormat('HH:mm') : DateFormat('d MMM');
  final value = timeFormat.format(utcDateTime);

  return value;
}

class DialogUtils {
  static void showErrorDialog(BuildContext context, String error) {
    showCupertinoDialog(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: Text(error),
          actions: [
            CupertinoDialogAction(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}

bool containsAnyWord(String stringA, String stringB) {
  List<String> words = stringB.split(' ');
  for (String word in words) {
    if (stringA.contains(word)) {
      return true;
    }
  }
  return false;
}

Color randomColor() {
  return Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
      .withOpacity(1.0);
}
