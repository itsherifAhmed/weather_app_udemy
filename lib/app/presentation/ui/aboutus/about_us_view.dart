import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/app/presentation/ui/aboutus/aboutusviewmodel.dart';
import '../../../shared/constant/string_keys.dart';
import '../../../shared/core/base/baseview.dart';
import '../../../shared/style/color.dart';
import '../../../shared/style/widgets.dart';

class AboutUsView extends StatelessWidget {
  const AboutUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<AboutUsViewModel>(
      init: (AboutUsViewModel vm) => vm.init(),
      builder: (BuildContext context, AboutUsViewModel vm, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            title: Text(StringsKeys.aboutApp.tr()),
            bottom: appBarDivider(),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        StringsKeys.appName,
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ),
                    const AppIcon(size: 200),
                    Padding(
                      padding: const EdgeInsets.only(top: 60, bottom: 6),
                      child: Text(
                        StringsKeys.createdBy.tr(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                    InkWell(
                      hoverColor: AppColors.transparent,
                      focusColor: AppColors.transparent,
                      splashColor: AppColors.transparent,
                      highlightColor: AppColors.transparent,
                      onTap: vm.githubLunch,
                      child: Text(
                        StringsKeys.authorName.tr(),
                        style: Theme.of(context).textTheme.headline4,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, bottom: 30),
                      child: InkWell(
                        hoverColor: AppColors.transparent,
                        focusColor: AppColors.transparent,
                        splashColor: AppColors.transparent,
                        highlightColor: AppColors.transparent,
                        onTap: vm.flutterLunch,
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              StringsKeys.usingFlutter.tr(),
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            const Padding(
                              padding: EdgeInsets.only(left: 8),
                              child: FlutterLogo(size: 24),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Text(
                        vm.version,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
