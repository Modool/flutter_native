import 'package:flutter_native_runtime/flutter_native_runtime.dart';

class Process {
  Process(this._target);

  factory Process.system() =>
      Process(classTarget.property(_propertyNameForProcessInfo));

  static final classTarget =
      NativeRuntime().classNamed(_classNameForProcessInfo);

  static const _classNameForProcessInfo = 'NSProcessInfo';
  static const _propertyNameForProcessInfo = 'processInfo';

  final NativeTarget _target;

  Future<Map> get environment => _target.property('environment').get<Map>();
  Future<List> get arguments => _target.property('arguments').get<List>();

  Future<String> get hostName => _target.property('hostName').get<String>();

  Future<String> get name => _target.property('processName').get<String>();

  Future<String> get globallyUnique =>
      _target.property('globallyUniqueString').get<String>();

  Future<String> get operatingSystemVersion =>
      _target.property('operatingSystemVersionString').get<String>();

  Future<int> get processIdentifier =>
      _target.property('processIdentifier').get<int>();

  Future<int> get processorCount =>
      _target.property('processorCount').get<int>();

  Future<int> get physicalMemory =>
      _target.property('physicalMemory').get<int>();

  Future<double> get systemUptime =>
      _target.property('systemUptime').get<double>();

  Future<bool> get automaticTerminationSupportEnabled =>
      _target.property('automaticTerminationSupportEnabled').get<bool>();
}
