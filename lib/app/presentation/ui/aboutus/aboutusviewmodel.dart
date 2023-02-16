import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:weather/app/shared/constant/app_value.dart';
import 'package:weather/app/shared/constant/string_keys.dart';
import 'package:weather/app/shared/utils/utils.dart';

import '../../../shared/core/base/baseviewmodel.dart';

class AboutUsViewModel extends BaseViewModel{
  late PackageInfo packageInfo;
  String _version='';

  String get version => _version;

  set version(String value) {
    _version = value;
    notifyListeners();
  }
  void getVersion()async {
    try {
      packageInfo=await PackageInfo.fromPlatform();
      version="${StringsKeys.version.tr()} ${packageInfo.version}" ;
    }catch(e){log(e.toString());}
  }
  void githubLunch()async {
  try{
    await launchUrl(
      getUri(AppValues.gitHubUrl)!
    );
  }catch(e){log(e.toString());}
  }

  void flutterLunch()async {
  try{
    await launchUrl(
      getUri(AppValues.flutterUrl)!
    );
  }catch(e){log(e.toString());}
  }

  void init()=>getVersion();
}