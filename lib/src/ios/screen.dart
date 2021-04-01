import 'dart:ui';

import 'package:flutter_native_runtime/flutter_native_runtime.dart';

final _screenClass = NativeRuntime().classNamed('UIScreen');

class Screen {
  Screen(this._target);

  factory Screen.main() => Screen(_screenClass.property('mainScreen'));

  final NativeTarget _target;

  Future<Rect> get bounds => _target.property('bounds').get<Rect>();

  Future<double> get scale => _target.property('scale').get<double>();

  Future<List> get availableModes =>
      _target.property('availableModes').get<List>();

  Future<int> get preferredMode => _target.property('preferredMode').get<int>();

  Future<int> get currentMode => _target.property('currentMode').get<int>();

  Future<int> get overscanCompensation =>
      _target.property('overscanCompensation').get<int>();

  Future<Map> get overscanCompensationInsets =>
      _target.property('overscanCompensationInsets').get<Map>();

  Future<bool> get captured => _target.property('captured').get<bool>();

  Future<Rect> get nativeBounds => _target.property('nativeBounds').get<Rect>();
  Future<double> get nativeScale =>
      _target.property('nativeScale').get<double>();

  Future<int> get maximumFramesPerSecond =>
      _target.property('maximumFramesPerSecond').get<int>();

  Future<double> get calibratedLatency =>
      _target.property('calibratedLatency').get<double>();

  Future<bool> get supportsFocus =>
      _target.property('supportsFocus').get<bool>();

  Future<Rect> get applicationFrame =>
      _target.property('applicationFrame').get<Rect>();
}
