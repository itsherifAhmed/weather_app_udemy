import 'package:flutter/material.dart';

import '../../style/color.dart';

RefreshIndicator refreshIndicatorView({
  required Future<void> Function() onRefresh,
  required Widget child,
}) {
  return RefreshIndicator(
    color: AppColors.green,
    backgroundColor: AppColors.white,
    onRefresh: onRefresh,
    child: SizedBox(
      height: double.infinity,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Center(
          child: child,
        ),
      ),
    ),
  );
}
