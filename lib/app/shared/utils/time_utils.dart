import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import '../constant/string_keys.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:io';
import '../style/color.dart';

///timestamp
///1-getdate
///2-gettimeHour
///3-getMonth
///4-getDaysandMonth

DateTime getDate(int timestamp) {
  return DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
}

String getTimeHour(int? timestamp) {
  String time = "";
  if (timestamp != null) {
    try {
      DateTime date = getDate(timestamp);
      if (timestamp != 0) {
        time =
            "${date.hour} : ${date.minute.toString().length == 1 ? "0${date.minute}" : "${date.minute}"}";
      }
    } catch (e) {
      log(e.toString());
    }
  }

  return time;
}

String getMonth(DateTime date) {
  switch (date.month) {
    case 1:
      return StringsKeys.jan.tr();
    case 2:
      return StringsKeys.feb.tr();
    case 3:
      return StringsKeys.mar.tr();
    case 4:
      return StringsKeys.apr.tr();
    case 5:
      return StringsKeys.may.tr();
    case 6:
      return StringsKeys.jun.tr();
    case 7:
      return StringsKeys.jul.tr();
    case 8:
      return StringsKeys.aug.tr();
    case 9:
      return StringsKeys.sept.tr();
    case 10:
      return StringsKeys.oct.tr();
    case 11:
      return StringsKeys.nov.tr();
    case 12:
      return StringsKeys.dec.tr();
    default:
      return '';
  }
}

String getDaysAndMonth(int? timestamp) {
  if (timestamp != null) {
    DateTime date = getDate(timestamp);
    return "${date.day} ${getMonth(date)}";
  } else {
    return "";
  }
}
