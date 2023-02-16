import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:weather/app/presentation/ui/main/widgets/day_hourly_view.dart';
import 'package:weather/app/presentation/ui/main/widgets/location_widget.dart';
import 'package:weather/app/presentation/ui/main/widgets/main_widgets.dart';
import 'package:weather/app/presentation/ui/main/widgets/temp_widget.dart';
import 'package:weather/app/presentation/ui/main/widgets/time_widget.dart';

import '../../../shared/constant/string_keys.dart';
import '../../../shared/core/base/baseview.dart';
import '../../../shared/core/base/refresh_view.dart';
import '../../../shared/style/color.dart';
import '../../../shared/style/widgets.dart';
import '../../../shared/utils/utils.dart';
import 'mainviewmodel.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<MainViewModel>(
      init: (MainViewModel vm) => vm.init(),
      builder: (BuildContext context, MainViewModel vm, Widget? child) {
        return vm.isBusy() ? const AppProgress() : Scaffold(
          appBar: AppBar(
            leading: Padding(
              padding: const EdgeInsets.only(
                top: 6.0,
                bottom: 6.0,
                left: 12.0,
              ),
              child: Tooltip(
                message: StringsKeys.aboutApp.tr(),
                child: InkWell(
                  hoverColor: AppColors.transparent,
                  focusColor: AppColors.transparent,
                  splashColor: AppColors.transparent,
                  highlightColor: AppColors.transparent,
                  child: const AppIcon(size: 30),
                  onTap: () => vm.toAboutUs(context),
                ),
              ),
            ),
            title: const Text(StringsKeys.appName),
            actions: vm.screenError ? null : <Widget>[
              buildMainPopUp(
                context: context,
                popUpItems: vm.popupmodel,
              ),
            ],
            bottom: appBarDivider(),
          ),
          body: refreshIndicatorView(
            onRefresh: () => vm.refreshScreen(context),
            child: vm.screenError ? const SomethingWentWrongView() : Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 760.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    buildLocationWidget(
                      context: context,
                      location: getClearName(
                        vm.location?.city,
                        vm.location?.country,
                        comma: true,
                      ),
                    ),
                    buildTimeWidget(
                      context: context,
                      time: vm.weather?.current?.dt,
                    ),
                    buildTempWidget(
                      context: context,
                      temp: vm.weather?.current?.temp,
                      description: vm.weather?.current?.weather?[0].description,
                      icon: vm.weather?.current?.weather?[0].icon,
                    ),
                    buildDayOrHourlyView(
                      context: context,
                      viewIndex: vm.viewIndex,
                      weatherHourly: vm.weather?.hourly?? [],
                      weatherByDay: vm.weather?.daily?? [],
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
