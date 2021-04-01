import 'package:flutter_native_runtime/flutter_native_runtime.dart';

final _deviceClass = NativeRuntime().classNamed('UIDevice');

class Device {
  Device(this._target);

  factory Device.current() => Device(_deviceClass.property('currentDevice'));

  final NativeTarget _target;

  Future<String> get name => _target.property('name').get<String>();
  Future<String> get model => _target.property('model').get<String>();
  Future<String> get localizedModel =>
      _target.property('localizedModel').get<String>();
  Future<String> get systemName => _target.property('systemName').get<String>();
  Future<String> get systemVersion =>
      _target.property('systemVersion').get<String>();
  Future<int> get orientation => _target.property('orientation').get<int>();
  Future<String> get identifierForVendor => _target
      .property('identifierForVendor')
      .property('UUIDString')
      .get<String>();

  Future<bool> get batteryMonitoringEnabled =>
      _target.property('batteryMonitoringEnabled').get<bool>();
  Future<int> get batteryState => _target.property('batteryState').get<int>();
  Future<double> get batteryLevel =>
      _target.property('batteryLevel').get<double>();

  Future<bool> get proximityMonitoringEnabled =>
      _target.property('proximityMonitoringEnabled').get<bool>();
  Future<bool> get proximityState =>
      _target.property('proximityState').get<bool>();

  Future<bool> get multitaskingSupported =>
      _target.property('multitaskingSupported').get<bool>();

  Future<int> get userInterfaceIdiom =>
      _target.property('userInterfaceIdiom').get<int>();
}
