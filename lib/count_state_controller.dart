import 'package:hooks_riverpod/all.dart';
import 'package:provider_listener_counter/count_state.dart';

class CountStateController extends StateController<CountState> {
  CountStateController(CountState state) : super(state);

  void increment() {
    state = CountState(state.count + 1);
  }
}
