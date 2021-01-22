import 'package:flutter/material.dart';
import 'package:RapidoReach/RapidoReach.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    RapidoReach.instance.init(apiToken: 'd5ece53df8ac97409298325fec81f3f7', userId: 'ANDROID_TEST_ID');
    RapidoReach.instance.setOnRewardListener(onRapidoReachReward);
    RapidoReach.instance
        .setRewardCenterClosed(onRapidoReachRewardCenterClosed);
    RapidoReach.instance
        .setRewardCenterOpened(onRapidoReachRewardCenterOpened);
    RapidoReach.instance
        .setSurveyAvaiableListener(onRapidoReachSurveyAvailable);
    super.initState();
  }

  void onRapidoReachReward(int quantity) {
    print('TR: $quantity');
  }

  void onRapidoReachSurveyAvailable(int survey) {
    print('TR: $survey');
  }

  void onRapidoReachRewardCenterClosed() {
    print('TR: closed');
  }

  void onRapidoReachRewardCenterOpened() {
    print('TR: opened');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Launch RapidoReach"),
              onPressed: () => RapidoReach.instance.show(),
            ),
            RaisedButton(
              child: Text("Launch RapidoReach Placement"),
              onPressed: () =>
                  RapidoReach.instance.show(),
            )
          ],
        )),
      ),
    );
  }
}
