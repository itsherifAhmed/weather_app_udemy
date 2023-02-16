import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:weather/app/presentation/router/approutes.dart';
import 'package:weather/app/presentation/ui/spalsh/splashviewmodel.dart';
import 'package:weather/app/shared/style/widgets.dart';

import '../../../shared/core/base/baseview.dart';

class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<SplashViewModel>(
      init: (SplashViewModel vm)=>vm.init(() {goRouterFun(context);}),
      builder:(BuildContext context,SplashViewModel vm,Widget? child){
        return vm.isBusy()? const AppProgress()
                          : const Scaffold(body: Center(child: AppIcon(size: 240),),);
      } ,
    );
  }

  void goRouterFun(BuildContext context)=>context.go(AppRoutes.main);
}
