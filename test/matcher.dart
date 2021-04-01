import 'package:flutter/services.dart';
import 'package:flutter_native_runtime/flutter_native_runtime.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class TargetMatcher extends Matcher {
  TargetMatcher(this.target);

  final NativeTarget target;

  @override
  Description describe(Description description) => description.add('$target');

  @override
  bool matches(item, Map matchState) {
    if (item is Map) {
      return _matches(item, target.toMap());
    }
    return false;
  }

  bool _matches(Map item1, Map item2) {
    if (item1 == item2) return true;

    if (item1['n'] != item2['n']) return false;
    if (item1['t'] != item2['t']) return false;

    final a1 = item1['a'];
    final a2 = item2['a'];

    if (a1.toString() != a2.toString()) return false;

    return _matches(item1['p'], item2['p']);
  }
}

class MockChannel extends Mock implements MethodChannel {}
