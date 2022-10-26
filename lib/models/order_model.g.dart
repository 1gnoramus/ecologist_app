// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      senderCompanyName: json['senderCompanyName'] as String,
      storageName: json['storageName'] as String,
      wasteType: json['wasteType'] as String,
      cargoWeight: json['cargoWeight'] as String,
      orderId: json['orderId'] as String,
      transpType: json['transpType'] as String,
      shippingCost: json['shippingCost'] as String,
      orderStatus: json['orderStatus'] as String,
      documentId: json['documentId'] as String,
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      'senderCompanyName': instance.senderCompanyName,
      'storageName': instance.storageName,
      'wasteType': instance.wasteType,
      'cargoWeight': instance.cargoWeight,
      'orderId': instance.orderId,
      'documentId': instance.documentId,
      'transpType': instance.transpType,
      'orderStatus': instance.orderStatus,
      'shippingCost': instance.shippingCost,
    };
