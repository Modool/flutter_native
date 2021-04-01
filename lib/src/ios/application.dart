import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class Application {
  Application(this._target);

  factory Application.application() =>
      Application(applicationClass.method(_methodNameForSharedApplication));

  static final applicationClass =
      NativeRuntime().classNamed(_classNameForApplication);

  static const _methodNameForSharedApplication = 'sharedApplication';
  static const _classNameForApplication = 'UIApplication';

  final NativeTarget _target;

  Future<bool> get networkActivityIndicatorVisible =>
      _target.property('networkActivityIndicatorVisible').get<bool>();

  Future<void> setNetworkActivityIndicatorVisible({@required bool visible}) =>
      _target.property('networkActivityIndicatorVisible').set(visible);

  Future<bool> get idleTimerDisabled =>
      _target.property('idleTimerDisabled').get<bool>();

  Future<void> setIdleTimerDisabled({@required bool disabled}) =>
      _target.property('idleTimerDisabled').set(disabled);

  Future<int> get statusBarStyle =>
      _target.property('statusBarStyle').get<int>();

  Future<bool> get statusBarHidden =>
      _target.property('statusBarHidden').get<bool>();

  Future<int> get statusBarOrientation =>
      _target.property('statusBarOrientation').get<int>();

  Future<Rect> get statusBarFrame =>
      _target.property('statusBarFrame').get<Rect>();

  Future<int> get iconBadgeNumber =>
      _target.property('applicationIconBadgeNumber').get<int>();

  Future<void> setIconBadgeNumber(int iconBadgeNumber) =>
      _target.property('applicationIconBadgeNumber').set(iconBadgeNumber);

  Future<bool> get supportsShakeToEdit =>
      _target.property('applicationSupportsShakeToEdit').get<bool>();

  Future<void> setSupportsShakeToEdit({bool supportsShakeToEdit}) => _target
      .property('applicationSupportsShakeToEdit')
      .set(supportsShakeToEdit);

  Future<bool> get state => _target.property('applicationState').get<bool>();
}
