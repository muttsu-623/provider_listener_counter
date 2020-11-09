import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_listener_counter/state_controller_providers.dart';

class CounterText extends ConsumerWidget {
  CounterText(this._scaffoldKey);
  final GlobalKey<ScaffoldState> _scaffoldKey;
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final countState = watch(countStateControllerProvider.state);
    showSnackBar(countState.count);
    return Text(
      '${countState.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }

  void showSnackBar(int count) {
    String snackBarText;
    if (count % 2 == 0) {
      snackBarText = '$count is Even!';
    } else {
      snackBarText = '$count is Odd!';
    }
    _scaffoldKey.currentState
        .showSnackBar(SnackBar(content: Text(snackBarText)));
  }
}
