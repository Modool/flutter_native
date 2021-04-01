import 'dart:ui';

import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final application = Application(target);

  void _when<T>(String name, List arguments, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.property(name))),
    )).thenAnswer((_) async => result);
  }

  void _whenNoResult(String name, List arguments) => _when<void>(name, arguments, null);

  void _whenNoArgs<T>(String name, T result) => _when<T>(name, null, result);

  test('global', () async {
    expect(Application.application(), isNotNull);
  });

  test('networkActivityIndicatorVisible', () async {
    _whenNoArgs<bool>('networkActivityIndicatorVisible', true);
    expect(await application.networkActivityIndicatorVisible, true);

    _whenNoResult('networkActivityIndicatorVisible', [true]);
    await application.setNetworkActivityIndicatorVisible(visible: true);
  });

  test('idleTimerDisabled', () async {
    _whenNoArgs<bool>('idleTimerDisabled', true);
    expect(await application.idleTimerDisabled, true);

    _whenNoResult('idleTimerDisabled', [true]);
    await application.setIdleTimerDisabled(disabled: true);
  });

  test('status bar', () async {
    _whenNoArgs<int>('statusBarStyle', 1);
    _whenNoArgs<bool>('statusBarHidden', true);
    _whenNoArgs<int>('statusBarOrientation', 1);
    _whenNoArgs<Rect>('statusBarFrame', const Rect.fromLTRB(1, 1, 1, 1));

    expect(await application.statusBarStyle, 1);
    expect(await application.statusBarHidden, true);
    expect(await application.statusBarOrientation, 1);
    expect(await application.statusBarFrame, const Rect.fromLTRB(1, 1, 1, 1));
  });

  test('iconBadgeNumber', () async {
    _whenNoArgs<int>('applicationIconBadgeNumber', 1);
    expect(await application.iconBadgeNumber, 1);

    _whenNoResult('applicationIconBadgeNumber', [1]);
    await application.setIconBadgeNumber(1);
  });

  test('supportsShakeToEdit', () async {
    _whenNoArgs<bool>('applicationSupportsShakeToEdit', true);
    expect(await application.supportsShakeToEdit, true);

    _whenNoResult('applicationSupportsShakeToEdit', [true]);
    await application.setSupportsShakeToEdit(supportsShakeToEdit: true);
  });

  test('state', () async {
    _whenNoArgs<bool>('applicationState', true);
    expect(await application.state, true);
  });
}
