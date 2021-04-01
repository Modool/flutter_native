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
  final androidBuild = Build.system();
  final androidContext =
      Context(nativeRuntime.instanceNamed('Registrar').method('context'));
  final androidContext2 = Context(
      nativeRuntime.instanceNamed('Registrar').memberVariable('mAppContext'));

  String model;
  String packageName;
  String packageName2;

  @override
  void initState() {
    androidBuild.model.then((model) {
      setState(() {
        this.model = model;
      });
    });

    androidContext.packageName.then((packageName) {
      setState(() {
        this.packageName = packageName;
      });
    });
    androidContext2.packageName.then((packageName) {
      setState(() {
        packageName2 = packageName;
      });
    });

    super.initState();
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
            Text('Class(android.os.Build)->MODEL: $model'),
            Text('Registrar.context().getPackageName(): $packageName'),
            Text('Registrar->mAppContext.getPackageName(): $packageName2'),
          ],
        ),
      ),
    );
  }
}
