import 'package:json_annotation/json_annotation.dart';
part 'order_model.g.dart';

@JsonSerializable()
class OrderModel {
  OrderModel(
      {required this.senderCompanyName,
      required this.storageName,
      required this.wasteType,
      required this.cargoWeight,
      required this.orderId,
      required this.transpType,
      required this.shippingCost,
      required this.orderStatus});

  final String senderCompanyName;
  final String storageName;
  final String wasteType;
  final String cargoWeight;
  final String orderId;
  final String transpType;
  final String orderStatus;

  final String shippingCost;

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return _$OrderModelFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$OrderModelToJson(this);
  }
}
