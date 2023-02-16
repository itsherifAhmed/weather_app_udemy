import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';

import '../../../../domain/response/weather_response.dart';
import '../../../../shared/constant/string_keys.dart';
import '../../../../shared/utils/time_utils.dart';
import 'main_widgets.dart';

Widget buildDayOrHourlyView({
  required BuildContext context,
  required int viewIndex,
  required List<Hourly> weatherHourly,
  required List<Daily> weatherByDay,
}) {
  switch (viewIndex) {
    case 0:
      return weatherHourly.isEmpty ? const Offstage() : _buildWeatherView(
        context: context,
        header: StringsKeys.hourlyWeather.tr(),
        children: weatherHourly.map((e) => _buildWeatherItem(
          context: context,
          head: getTimeHour(e.dt),
          temp: e.temp,
          icon: e.weather?[0].icon,
          weather: e.weather?[0].main?? '',
        )).toList(),
      );
    case 1:
      return weatherByDay.isEmpty ? const Offstage() : _buildWeatherView(
        context: context,
        header: StringsKeys.weatherByDay.tr(),
        children: weatherByDay.map((e) => _buildWeatherItem(
          context: context,
          head: getDaysAndMonth(e.dt),
          temp: e.temp?.day,
          icon: e.weather?[0].icon,
          weather: e.weather?[0].main?? '',
        )).toList(),
      );
    default:
      return const Offstage();
  }
}


Widget _buildWeatherItem({
  required BuildContext context,
  required String head,
  required double? temp,
  required String? icon,
  required String weather,
}) {
  return Container(
    clipBehavior: Clip.hardEdge,
    margin: const EdgeInsets.all(6),
    padding: const EdgeInsets.all(4),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
    ),
    constraints: const BoxConstraints(
      minWidth: 110,
      minHeight: 150,
    ),
    child: Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Text(
            head,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ),
        buildTempText(
          context: context,
          temp: temp,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: buildWeatherIcon(icon),
        ),
        Text(
          weather.toLowerCase(),
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    ),
  );
}

Widget _buildWeatherView({
  required BuildContext context,
  required String header,
  required List<Widget> children,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 42, left: 16, bottom: 12),
        child: Text(
          header,
          style: Theme.of(context).textTheme.headline3,
        ),
      ),
      kIsWeb ? Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Wrap(
          children: children,
        ),
      ) : SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: children,
          ),
        ),
      ),
    ],
  );
}
