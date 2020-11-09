import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:provider_listener_counter/state_controller_providers.dart';
import 'package:provider_listener_counter/counter_text.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  final Widget _scaffoldBody = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text('You have pushed the button this many times:'),
        CounterText(),
      ],
    ),
  );
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    final countState = watch(countStateControllerProvider.state);
    showSnackBar(countState.count);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(title),
      ),
      body: _scaffoldBody,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read(countStateControllerProvider).increment(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void showSnackBar(int count) {
    String snackBarText;
    if (count % 2 == 0) {
      snackBarText = '$count is Even!';
    } else {
      snackBarText = '$count is Odd!';
    }
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => _scaffoldKey.currentState.showSnackBar(
        SnackBar(content: Text(snackBarText)),
      ),
    );
  }
}
