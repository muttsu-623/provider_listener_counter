import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:provider_listener_counter/state_controller_providers.dart';

class CounterText extends ConsumerWidget {
  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final countState = watch(countStateControllerProvider.state);
    return Text(
      '${countState.count}',
      style: Theme.of(context).textTheme.headline4,
    );
  }
}
