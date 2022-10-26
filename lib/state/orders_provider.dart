import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/order_model.dart';

final _firestore = FirebaseFirestore.instance;

class OrderProvider {
  Future<List<OrderModel>> getDriverOrders() async {
    List<OrderModel> orderBoxesList = [];

    try {
      final response = await _firestore.collection('EcoOrders').get();
      print(response.runtimeType);
      // JSON -> UserModel
      for (var resp in response.docs) {
        print(resp.data());
        var orderModel = OrderModel.fromJson(resp.data());
        orderBoxesList.add(orderModel);
      }

      return orderBoxesList;
    } catch (e) {
      throw Exception('Exception on getDriverOrders: $e');
    }
  }

  // Future <String> getDocumentId(OrderModel orderModel) async {
  //   try {
  //     var order = orderModel.toJson();
  //     var doc = await _firestore.collection('EcoOrders').add(order);
  //     var documentId = doc.id;
  //     print(documentId);
  //     _firestore
  //         .collection('Orders')
  //         .doc(documentId)
  //         .set({'orderId': documentId}, SetOptions(merge: true));
  //       return documentId
  //   } catch (e) {
  //     throw Exception('Exception on orderPicker: $e');
  //   }
  // }

  Future placeNewOrder(OrderModel orderModel) async {
    try {
      var order = orderModel.toJson();
      var doc = await _firestore.collection('EcoOrders').add(order);

      var documentId = doc.id;
      print(documentId);
      await _firestore
          .collection('EcoOrders')
          .doc(documentId)
          .set({'documentId': documentId}, SetOptions(merge: true));
    } catch (e) {
      throw Exception('Exception on placeNewOrder: $e');
    }
  }

  Future changeOrderStatus_Driv_1(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Закреплено за водителем_1'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_AcceptedFromSender(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Принято у отправителя'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_DeliveredToStorage(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Доставлено на склад'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_ReadyForShippment(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Готово к отгрузке'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Driv_2(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Закреплено за водителем_2'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }

  Future changeOrderStatus_Completed(orderId) async {
    try {
      final response = await _firestore
          .collection('EcoOrders')
          .doc(orderId)
          .update({'orderStatus': 'Завершено'}).then(
              (value) => print('Success'));
    } catch (e) {
      throw Exception('Exception on orderPicker: $e');
    }
  }
}
