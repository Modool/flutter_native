# Flutter Native Runtime Package

A native runtime package for Flutter. This plugin provides a cross-platform (iOS, Android) API to request and call native method or variable.

![Flutter Test](https://github.com/Modool/flutter_native/workflows/Flutter%20Test/badge.svg) [![pub package](https://img.shields.io/pub/v/flutter_native.svg)](https://pub.dartlang.org/packages/flutter_native) [![Build Status](https://app.bitrise.io/app/fa4f5d4bf452bcfb/status.svg?token=HorGpL_AOw2llYz39CjmdQ&branch=master)](https://app.bitrise.io/app/fa4f5d4bf452bcfb) [![style: effective dart](https://img.shields.io/badge/style-effective_dart-40c4ff.svg)](https://github.com/tenhobi/effective_dart)
## Features

* Access android classes.
* Access ios classes.

## Usage

To use this package, add `flutter_native` as a [dependency in your pubspec.yaml file](https://flutter.io/platform-plugins/). For example:

```yaml
dependencies:
  flutter_object_cache: 0.0.1
```

## API

### Access native

```dart
import 'package:flutter_native/flutter_native.dart';

// To get system version for ios
final iosDevice = Device();
final systemVersion = await iosDevice.systemVersion;

// To get package name for android
final context = Context();
final packageName = await context.packageName;

// Instance type for android
final registrarTarget = nativeRuntime.instanceNamed('Registrar');
```

### iOS Support class 

Native Class | Futter Class 
-------------|--------------
-------------|--------------
 UIDevice | Device
 UIScreen | Screen
 UIApplication | Application
 NSBundle | Bundle 
 NSProcessInfo | Process
 NSUserDefaults | UserDefaults

### Android Support class

Native Class | Futter Class 
---| ---
 Context | Context
 AssetManager | AssetManager
 ClassLoader | ClassLoader
 ApplicationInfo | ApplicationInfo 
 Resources | Resources
 ResourcesImpl | ResourcesImpl
 SharedPreferences | SharedPreferences
 
## Issues

Please file any issues, bugs or feature request as an issue on our [Github](https://github.com/modool/flutter_native/issues) page.

## Want to contribute

If you would like to contribute to the plugin (e.g. by improving the documentation, solving a bug or adding a cool new feature), please carefully review our [contribution guide](CONTRIBUTING.md) and send us your [pull request](https://github.com/modool/flutter_native/pulls).

## Author

This Flutter Native package for Flutter is developed by [modool](https://github.com/modool). You can contact us at <modool.go@gmail.com>
