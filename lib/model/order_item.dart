import 'package:kitchen_it/model/order.dart';

class OrderItem {
  int id;
  int idProduct;
  int idOrder;
  Order order;

  OrderItem({
    required this.id,
    required this.idProduct,
    required this.idOrder,
    required this.order,
  });
}
