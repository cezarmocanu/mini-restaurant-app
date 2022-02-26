abstract class DataEvent {}

class GetData extends DataEvent {
  final String name;

  GetData(this.name);
}
