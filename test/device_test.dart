import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final device = Device(target);

  void _whenProperty<T>(String name, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.property(name))),
    )).thenAnswer((_) async => result);
  }

  test('global', () async {
    expect(Device.current(), isNotNull);
  });

  test('name', () async {
    _whenProperty<String>('name', 'ok');
    expect(await device.name, 'ok');
  });

  test('model', () async {
    _whenProperty<String>('model', 'ok');
    expect(await device.model, 'ok');
  });

  test('localizedModel', () async {
    _whenProperty<String>('localizedModel', 'ok');
    expect(await device.localizedModel, 'ok');
  });

  test('systemName', () async {
    _whenProperty<String>('systemName', 'ok');
    expect(await device.systemName, 'ok');
  });

  test('systemVersion', () async {
    _whenProperty<String>('systemVersion', 'ok');
    expect(await device.systemVersion, 'ok');
  });

  test('orientation', () async {
    _whenProperty<int>('orientation', 1);
    expect(await device.orientation, 1);
  });

  test('systemVersion', () async {
    _whenProperty<String>('systemVersion', 'ok');
    expect(await device.systemVersion, 'ok');
  });

  test('systemVersion', () async {
    _whenProperty<String>('systemVersion', 'ok');
    expect(await device.systemVersion, 'ok');
  });

  test('systemVersion', () async {
    _whenProperty<String>('systemVersion', 'ok');
    expect(await device.systemVersion, 'ok');
  });

  test('identifierForVendor', () async {
    when(channel.invokeMethod<String>(
      'invoke',
      argThat(TargetMatcher(target.property('identifierForVendor').property('UUIDString'))),
    )).thenAnswer((_) async => 'ok');
    _whenProperty<String>('identifierForVendor', 'ok');
    expect(await device.identifierForVendor, 'ok');
  });

  test('batteryMonitoringEnabled', () async {
    _whenProperty<bool>('batteryMonitoringEnabled', true);
    expect(await device.batteryMonitoringEnabled, true);
  });

  test('batteryState', () async {
    _whenProperty<int>('batteryState', 1);
    expect(await device.batteryState, 1);
  });

  test('batteryLevel', () async {
    _whenProperty<double>('batteryLevel', 0.5);
    expect(await device.batteryLevel, 0.5);
  });

  test('proximityMonitoringEnabled', () async {
    _whenProperty<bool>('proximityMonitoringEnabled', true);
    expect(await device.proximityMonitoringEnabled, true);
  });

  test('proximityState', () async {
    _whenProperty<bool>('proximityState', true);
    expect(await device.proximityState, true);
  });

  test('multitaskingSupported', () async {
    _whenProperty<bool>('multitaskingSupported', true);
    expect(await device.multitaskingSupported, true);
  });

  test('userInterfaceIdiom', () async {
    _whenProperty<int>('userInterfaceIdiom', 1);
    expect(await device.userInterfaceIdiom, 1);
  });
}
