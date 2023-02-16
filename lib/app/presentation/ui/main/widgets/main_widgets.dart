import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../../../../shared/constant/app_value.dart';
import '../../../../shared/constant/string_keys.dart';
import '../../../../shared/style/widgets.dart';
import '../../../../shared/utils/utils.dart';

PopupMenuButton<PopUpModel> buildMainPopUp({
  required BuildContext context,
  required List<PopUpModel> popUpItems,
}) {
  return PopupMenuButton<PopUpModel>(
    tooltip: StringsKeys.more.tr(),
    padding: EdgeInsets.zero,
    icon: const Icon(Icons.more_vert),
    onSelected: (v) => v.func(),
    onCanceled: () => FocusScope.of(context).unfocus(),
    itemBuilder: (_) {
      return popUpItems.map((PopUpModel e) {
        return PopupMenuItem<PopUpModel>(
          value: e,
          child: Text(e.title),
        );
      }).toList();
    },
  );
}

RichText buildTempText({
  required BuildContext context,
  required double? temp,
}) {
  return RichText(
    text: TextSpan(
      text: k2c(temp),
      style: Theme.of(context).textTheme.headline1,
      children: <TextSpan>[
        TextSpan(
          text: AppValues.symbolCelsius,
          style: Theme.of(context).textTheme.headline4,
        ),
      ],
    ),
  );
}

ClipRRect buildWeatherIcon(String? icon) {
  return ClipRRect(
    borderRadius: const BorderRadius.all(Radius.circular(8)),
    child: SizedBox(
      width: 36,
      height: 36,
      child: AppNetworkImage(
        getWeatherImage(icon),
      ),
    ),
  );
}
