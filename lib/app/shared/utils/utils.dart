import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import 'package:weather/app/shared/constant/string_keys.dart';
import 'package:universal_html/html.dart' as html;
import '../style/color.dart';
import 'dart:io';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

///apple  macos ios
///error
///getweatherimage
///k2c
///doubleparser
///getlanguagecode
///uri
///futeuredelayed

bool isApple() {
  ///                                           true                                           true
  return defaultTargetPlatform == TargetPlatform.macOS ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

void errorToast({required String? code, String? msg}) {
  Fluttertoast.showToast(
    msg: 'Error Code: $code\nError Message: $msg',
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: AppColors.white.withOpacity(0.4),
    textColor: AppColors.black,
    fontSize: 16.0,
  );
}

String getWeatherImage(String? icon) {
  String res = "";
  if (icon != null) {
    if (icon.isNotEmpty) {
      res = AppValues.imgUrl + icon + AppValues.png;
    }
  }
  return res;
}

String k2c(double? k) {
  if (k == null) {
    return StringsKeys.notSpecified;
  } else {
    return (k - 273.15).toStringAsFixed(1);
  }
}

double? doubleParser(data) {
  try {
    final double? doubleResult = double.tryParse(data.toString());
    if (doubleResult != null) {
      return doubleResult;
    } else {
      int? intResult = int.tryParse(data.toString());
      if (intResult != null) {
        return intResult.toDouble();
      } else {
        return null;
      }
    }
  } catch (e) {
    return null;
  }
}
String getClearName(String? firstName, String? lastName, {comma = false}) {
  return (firstName ?? '') +
      (firstName == null ? '' : firstName.isEmpty ? '' :
      comma ? lastName == null ? '' : lastName.isEmpty ? '' : ', ' : ' ')
      + (lastName ?? '');
}


String getLanguageCode() {
  try {
    String? langCode;
    if (kIsWeb) {
      langCode = html.window.navigator.language;
      if (langCode != null) {
        langCode = langCode.split("_")[0];
      }
    } else {
      langCode = Platform.localeName.split("_").first;
    }
    switch (langCode) {
      case AppValues.langCodeUk:
        return AppValues.langCodeUk;
      case AppValues.langCodeEn:
        return AppValues.langCodeEn;
      default:
        return AppValues.langCodeBasic;
    }
  } catch (e) {
    return AppValues.langCodeBasic;
  }
}

Uri? getUri(String url) {
  return Uri.tryParse(url);
}

Future<void> futureDelayed({int m = 1000}) async {
  await Future.delayed(Duration(milliseconds: m));
}



