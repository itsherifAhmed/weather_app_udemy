import 'package:flutter/material.dart';

Padding buildLocationWidget({
  required BuildContext context,
  required String location,
}) {
  return Padding(
    padding: const EdgeInsets.only(top: 24, left: 16),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        Flexible(
          child: Text(
            location,
            softWrap: true,
            style: Theme.of(context).textTheme.headline3,
          ),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Icon(Icons.location_pin),
        ),
      ],
    ),
  );
}
