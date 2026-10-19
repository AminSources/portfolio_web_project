abstract class DataState<T> {
  final T? data;
  final String? message;

  new({required this.data, required this.message});
}

class DataSuccess<T> extends DataState<T> {
  new(T data) : super(data: data, message: null);
}

class DataFailure<T> extends DataState<T> {
  new(String message) : super(data: null, message: message);
}
