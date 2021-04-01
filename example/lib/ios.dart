import 'package:flutter/material.dart';
import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';

final nativeRuntime = NativeRuntime();

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String systemVersion;
  String processName;
  Map map;

  bool idleDisabled = false;

  final userDefaults = UserDefaults.named(
      'test_name', nativeRuntime.classNamed('NSUserDefaults'));
  final device = Device.current();
  final process = Process.system();
  final bundle = Bundle.main();
  final application = Application.application();

  String customUserDefaultValue;

  @override
  void initState() {
    userDefaults.then((defaults) async {
      await defaults.setObject('1', 'test_key');
      customUserDefaultValue = await defaults.objectForKey('test_key');

      map = await defaults.representation;
      setState(() {});
    });

    device.systemVersion.then((version) {
      systemVersion = version;
      setState(() {});
    });

    process.name.then((name) {
      processName = name;
      setState(() {});
    });
    application.idleTimerDisabled.then((disabled) {
      idleDisabled = disabled;
    });

    Future.delayed(const Duration(seconds: 10), () async {
      await application.setIdleTimerDisabled(disabled: true);
      idleDisabled = await application.idleTimerDisabled;
      setState(() {});
    });
    super.initState();
  }

  @override
  Future<void> dispose() async {
    await (await userDefaults).dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Column(
          children: <Widget>[
            Text('UIDevice.currentDevice.systemVersion: $systemVersion'),
            Text('NSProcessInfo: processName: ${processName.toString()}'),
            Text(
                'NSUserDefaults: dictionaryRepresentation: ${processName.toString()}'),
            Text(
                '[[NSUserDefaults alloc] initWithSuiteName: @"test_name"] : test_key : $customUserDefaultValue'),
            Text('application.idleTimerDisabled : $idleDisabled'),
          ],
        ),
      ),
    );
  }
}
