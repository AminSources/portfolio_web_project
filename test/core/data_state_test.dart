import 'package:flutter_test/flutter_test.dart';
import 'package:portfolio_web_project/core/resources/data_state.dart';

void main() {
  group('DataState', () {
    test('DataSuccess holds data and null message', () {
      final state = DataSuccess<int>(42);

      expect(state.data, 42);
      expect(state.message, isNull);
    });

    test('DataFailure holds message and null data', () {
      final state = DataFailure<int>('boom');

      expect(state.message, 'boom');
      expect(state.data, isNull);
    });

    test('DataSuccess is a DataState subtype', () {
      final DataState<String> state = DataSuccess('ok');

      expect(state, isA<DataSuccess<String>>());
      expect(state, isNot(isA<DataFailure<String>>()));
    });

    test('DataFailure is a DataState subtype', () {
      final DataState<String> state = DataFailure('error');

      expect(state, isA<DataFailure<String>>());
      expect(state, isNot(isA<DataSuccess<String>>()));
    });
  });
}
