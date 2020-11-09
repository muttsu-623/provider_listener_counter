import 'package:provider_listener_counter/count_state.dart';
import 'package:state_notifier/state_notifier.dart';

class CountStateController extends StateNotifier<CountState> {
  CountStateController(CountState state) : super(state);

  void increment() {
    state = CountState(state.count + 1);
  }
}
