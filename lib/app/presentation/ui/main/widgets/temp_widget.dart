import 'package:flutter/material.dart';

import 'main_widgets.dart';

Row buildTempWidget({
  required BuildContext context,
  required double? temp,
  required String? description,
  required String? icon,
}) {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: <Widget>[
      Padding(
        padding: const EdgeInsets.only(top: 8, left: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildTempText(
              context: context,
              temp: temp,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text(description?? ''),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(left: 14),
        child: buildWeatherIcon(icon),
      ),
    ],
  );
}
