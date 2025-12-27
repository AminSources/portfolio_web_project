abstract class DataState<T> {
  final T? data;
  final String? message;

  DataState({required this.data, required this.message});
}

class DataSuccess<T> extends DataState<T> {
  DataSuccess(T data) : super(data: data, message: null);
}

class DataError<T> extends DataState<T> {
  DataError(String message) : super(data: null, message: message);
}
