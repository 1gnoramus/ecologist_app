import 'package:flutter/material.dart';

import '../models/order_model.dart';
import 'orders_provider.dart';

class AppStateManager extends ChangeNotifier {
  AppStateManager({required this.orderProvider});
  final OrderProvider? orderProvider;

  List<OrderModel>? _orders;
  List<OrderModel>? get orders => _orders;

  Map<List, dynamic> newOrders = {};

  Future<void> changeOrderStatus_Driv_1(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_Driv_1(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_AcceptedFromSender(orderId) async {
    try {
      final response =
          await orderProvider?.changeOrderStatus_AcceptedFromSender(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_DeliveredToStorage(orderId) async {
    try {
      final response =
          await orderProvider?.changeOrderStatus_DeliveredToStorage(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_ReadyForShippment(orderId) async {
    try {
      final response =
          await orderProvider?.changeOrderStatus_ReadyForShippment(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Driv_2(orderId) async {
    try {
      final response = await orderProvider?.changeOrderStatus_Driv_2(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> changeOrderStatus_Completed(orderId) async {
    try {
      final response =
          await orderProvider?.changeOrderStatus_Completed(orderId);
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  Future<void> getDriverOrders() async {
    try {
      final response = await orderProvider?.getDriverOrders();
      _orders = response;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
    notifyListeners();
  }

  // Future<void> getDocumentId() async {
  //   try {
  //     final response = await orderProvider?.getDocumentId();
  //   } catch (e) {
  //     throw Exception('Exception on getDriverOrders: $e');
  //   }
  //   notifyListeners();
  // }

  Future<void> placeNewOrder(orderModel) async {
    try {
      final response = await orderProvider?.placeNewOrder(orderModel);
    } catch (e) {
      throw Exception('Exception on placeNewOrder: $e');
    }
    notifyListeners();
  }
}
