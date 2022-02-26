abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataSuccess extends DataState {
  final String name;
  DataSuccess(this.name);
}

class DataError extends DataState {
  final int errorCode;
  DataError(this.errorCode);
}
