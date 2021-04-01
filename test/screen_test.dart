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
  final screen = Screen(target);

  void _whenProperty<T>(String name, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.property(name))),
    )).thenAnswer((_) async => result);
  }

  test('global', () async {
    expect(Screen.main(), isNotNull);
  });

  test('bounds', () async {
    _whenProperty<Rect>('bounds', const Rect.fromLTRB(1, 1, 1, 1));
    expect(await screen.bounds, const Rect.fromLTRB(1, 1, 1, 1));
  });

  test('scale', () async {
    _whenProperty<double>('scale', 0.5);
    expect(await screen.scale, 0.5);
  });

  test('availableModes', () async {
    _whenProperty<List>('availableModes', ['1']);
    expect(await screen.availableModes, ['1']);
  });

  test('preferredMode', () async {
    _whenProperty<int>('preferredMode', 1);
    expect(await screen.preferredMode, 1);
  });

  test('currentMode', () async {
    _whenProperty<int>('currentMode', 1);
    expect(await screen.currentMode, 1);
  });

  test('overscanCompensation', () async {
    _whenProperty<int>('overscanCompensation', 1);
    expect(await screen.overscanCompensation, 1);
  });

  test('overscanCompensationInsets', () async {
    _whenProperty<Map>('overscanCompensationInsets', {'1': 'ok'});
    expect(await screen.overscanCompensationInsets, {'1': 'ok'});
  });

  test('captured', () async {
    _whenProperty<bool>('captured', true);
    expect(await screen.captured, true);
  });

  test('nativeBounds', () async {
    _whenProperty<Rect>('nativeBounds', const Rect.fromLTRB(1, 1, 1, 1));
    expect(await screen.nativeBounds, const Rect.fromLTRB(1, 1, 1, 1));
  });

  test('nativeScale', () async {
    _whenProperty<double>('nativeScale', 0.5);
    expect(await screen.nativeScale, 0.5);
  });

  test('maximumFramesPerSecond', () async {
    _whenProperty<int>('maximumFramesPerSecond', 1);
    expect(await screen.maximumFramesPerSecond, 1);
  });

  test('calibratedLatency', () async {
    _whenProperty<double>('calibratedLatency', 0.5);
    expect(await screen.calibratedLatency, 0.5);
  });

  test('supportsFocus', () async {
    _whenProperty<bool>('supportsFocus', true);
    expect(await screen.supportsFocus, true);
  });

  test('applicationFrame', () async {
    _whenProperty<Rect>('applicationFrame', const Rect.fromLTRB(1, 1, 1, 1));
    expect(await screen.applicationFrame, const Rect.fromLTRB(1, 1, 1, 1));
  });
}
