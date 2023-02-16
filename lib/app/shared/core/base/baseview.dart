
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../presentation/di/di.dart';

import 'baseviewmodel.dart';

class BaseView<T extends BaseViewModel> extends StatefulWidget {
  final Function(T)? init;
  final Widget Function(BuildContext context, T vm, Widget? child) builder;

  const BaseView({
    Key? key,
    this.init,
    required this.builder,
  }) : super(key: key);

  @override
  State<BaseView> createState() => _BaseViewState<T>();
}

class _BaseViewState<T extends BaseViewModel> extends State<BaseView<T>> {
  T vm = getit<T>();

  @override
  void initState() {
    if (widget.init != null) {
      widget.init!(vm);
    }
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
     create: (BuildContext context)=>vm,
      child:Consumer<T>(
        builder: widget.builder,
      ) ,
    );
  }

}

