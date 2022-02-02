class Order {
  int id;
  int idTable;
  String status;
  DateTime dateTime;
  DateTime preparedTime;

  Order({
    required this.id,
    required this.idTable,
    required this.status,
    required this.dateTime,
    required this.preparedTime,
  });
}
