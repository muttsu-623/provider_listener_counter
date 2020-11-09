import 'package:hooks_riverpod/all.dart';
import 'package:provider_listener_counter/count_state.dart';
import 'package:provider_listener_counter/count_state_controller.dart';

final countStateControllerProvider = StateNotifierProvider(
  (ref) => CountStateController(
    CountState(0),
  ),
);
