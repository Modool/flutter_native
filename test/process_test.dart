import 'package:flutter_native/flutter_native.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'matcher.dart';

void main() {
  final channel = MockChannel();
  final runtime = TestNativeRuntime(channel);

  final target = runtime.instanceNamed('mock');
  final process = Process(target);

  void _whenProperty<T>(String name, T result) {
    when(channel.invokeMethod<T>(
      'invoke',
      argThat(TargetMatcher(target.property(name))),
    )).thenAnswer((_) async => result);
  }

  test('global', () async {
    expect(Process.system(), isNotNull);
  });

  test('environment', () async {
    _whenProperty<Map>('environment', {'1': 'ok'});
    expect(await process.environment, {'1': 'ok'});
  });

  test('arguments', () async {
    _whenProperty<List>('arguments', ['1']);
    expect(await process.arguments, ['1']);
  });

  test('hostName', () async {
    _whenProperty<String>('hostName', 'ok');
    expect(await process.hostName, 'ok');
  });

  test('processName', () async {
    _whenProperty<String>('processName', 'ok');
    expect(await process.name, 'ok');
  });

  test('globallyUnique', () async {
    _whenProperty<String>('globallyUniqueString', 'ok');
    expect(await process.globallyUnique, 'ok');
  });

  test('operatingSystemVersion', () async {
    _whenProperty<String>('operatingSystemVersionString', 'ok');
    expect(await process.operatingSystemVersion, 'ok');
  });

  test('processIdentifier', () async {
    _whenProperty<int>('processIdentifier', 1);
    expect(await process.processIdentifier, 1);
  });

  test('processorCount', () async {
    _whenProperty<int>('processorCount', 1);
    expect(await process.processorCount, 1);
  });

  test('physicalMemory', () async {
    _whenProperty<int>('physicalMemory', 1);
    expect(await process.physicalMemory, 1);
  });

  test('systemUptime', () async {
    _whenProperty<double>('systemUptime', 0.5);
    expect(await process.systemUptime, 0.5);
  });

  test('automaticTerminationSupportEnabled', () async {
    _whenProperty<bool>('automaticTerminationSupportEnabled', true);
    expect(await process.automaticTerminationSupportEnabled, true);
  });
}
