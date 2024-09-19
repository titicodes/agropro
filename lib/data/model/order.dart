class OrderModel {
  String id;
  String status;
  double total;

  OrderModel({required this.id, required this.status, required this.total});

  factory OrderModel.fromMap(Map<String, dynamic> map) {
    return OrderModel(
      id: map['id'],
      status: map['status'],
      total: map['total'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'status': status,
      'total': total,
    };
  }
}
