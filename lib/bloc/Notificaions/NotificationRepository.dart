import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy_host/bloc/Notificaions/Notification.dart';

class NotificationRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future placeNotification(NotificationDetails notification) async {
    await db.collection("notifications").doc().set(notification.toJason());
  }
}
