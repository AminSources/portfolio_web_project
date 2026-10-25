import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';

void main() {
  group('DataSuccess', () {
    test('stores the supplied data and has no message', () {
      final state = DataSuccess<int>(42);

      expect(state, isA<DataState<int>>());
      expect(state.data, 42);
      expect(state.message, isNull);
    });

    test('supports collection payloads without changing their contents', () {
      final payload = <String>['alpha', 'beta'];
      final state = DataSuccess<List<String>>(payload);

      expect(state.data, same(payload));
      expect(state.data, ['alpha', 'beta']);
    });
  });

  group('DataFailure', () {
    test('stores the error message and has no data', () {
      final state = DataFailure<int>('Network unavailable');

      expect(state, isA<DataState<int>>());
      expect(state.data, isNull);
      expect(state.message, 'Network unavailable');
    });

    test('supports an empty but non-null failure message', () {
      final state = DataFailure<String>('');

      expect(state.data, isNull);
      expect(state.message, isEmpty);
    });
  });
}
