import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:stayegy_host/bloc/Notificaions/Notification.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/constants/constant.dart';

class BookRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  NotificationDetails confirmNotification = NotificationDetails(
    hotel: hotelDetailsGlobal.hid + " " + hotelDetailsGlobal.name,
    notificationType: "bookingAccepted",
    senderId: hotelDetailsGlobal.id,
    seen: false,
    time: Timestamp.fromDate(DateTime.now()),
  );
  NotificationDetails cancelNotification = NotificationDetails(
    hotel: hotelDetailsGlobal.hid + " " + hotelDetailsGlobal.name,
    notificationType: "bookingCancelled",
    senderId: hotelDetailsGlobal.id,
    seen: false,
    time: Timestamp.fromDate(DateTime.now()),
  );
  NotificationDetails checkedInNotification = NotificationDetails(
    hotel: hotelDetailsGlobal.hid + " " + hotelDetailsGlobal.name,
    notificationType: "checkedIn",
    senderId: hotelDetailsGlobal.id,
    seen: false,
    time: Timestamp.fromDate(DateTime.now()),
  );

  Future<List> getBookedList() async {
    List<BookDetails> bookedList = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').where('isCheckedIn', isEqualTo: false).get();

    print("booked length ${querySnapshot.docs.length}, hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      bookedList.add(BookDetails.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return bookedList;
  }

  Future<List> getPendingList() async {
    List<BookDetails> pendingList = [];

    QuerySnapshot pendingSnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'pending').get();
    print("pending length ${pendingSnapshot.docs.length} , hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < pendingSnapshot.docs.length; i++) {
      pendingList.add(BookDetails.fromMap(pendingSnapshot.docs[i].data()));
      print("${pendingSnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return pendingList;
  }

  Future<List> getGuestsList() async {
    List<BookDetails> guestsList = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').where('isCheckedIn', isEqualTo: true).get();

    print("guests length ${querySnapshot.docs.length}, hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      guestsList.add(BookDetails.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return guestsList;
  }

  Future<List> getBookingsbyRoomNo(String roomNo) async {
    List<BookDetails> bookings = [];

    Timestamp currentTime = Timestamp.fromDate(DateTime.now());

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').where('bookedRooms', arrayContains: roomNo).where('endDate', isGreaterThanOrEqualTo: currentTime).get();

    print("bookings length ${querySnapshot.docs.length}, hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      bookings.add(BookDetails.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return bookings;
  }

  Future<List> getFreeRooms(BookDetails bookDetails) async {
    List bookedRooms = [];
    List output = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').where('endDate', isGreaterThanOrEqualTo: bookDetails.startDate).get();

    print("bookedrooms length ${querySnapshot.docs.length}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      print(querySnapshot.docs[i].data()['startDate'].toDate());
      print(bookDetails.endDate.toDate());

      if (querySnapshot.docs[i].data()['startDate'].toDate().isBefore(bookDetails.endDate.toDate()) || querySnapshot.docs[i].data()['endDate'].toDate() == bookDetails.startDate.toDate()) {
        List tempBooklist = querySnapshot.docs[i].data()['bookedRooms'];

        tempBooklist.forEach((element) {
          bookedRooms.add(element);
        });

        if (querySnapshot.docs[i].data()['endDate'].toDate() == bookDetails.startDate.toDate()) {
          List templist = querySnapshot.docs[i].data()['bookedRooms'];
          templist.forEach((element) {
            output.add(element);
          });
          print('freerooms same date $output');
        }

        print('executed');
      }
    }

    print('booked rooms $bookedRooms');

    hotelDetailsGlobal.rooms.forEach((element) {
      if (!bookedRooms.contains(element)) {
        output.add(element);
      }
    });

    print('freerooms $output');

    if (bookedRooms.isEmpty) {
      return hotelDetailsGlobal.rooms;
    } else {
      return output;
    }
  }

  Future<bool> confirmBooking(BookDetails bookDetails) async {
    final documentReference = await db.collection("bookings").where("bid", isEqualTo: bookDetails.bid).get();
    print(documentReference.docs.first.id);
    if (documentReference.docs.isNotEmpty) {
      print(documentReference.docs.first.id);
      confirmNotification.receiverId = bookDetails.uid;
      await db.collection("bookings").doc(documentReference.docs.first.id).update(bookDetails.toJason());
      await db.collection("notifications").doc().set(confirmNotification.toJason());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> cancelBooking(BookDetails bookDetails) async {
    final documentReference = await db.collection("bookings").where("bid", isEqualTo: bookDetails.bid).get();
    print(documentReference.docs.first.id);
    if (documentReference.docs.isNotEmpty) {
      print(documentReference.docs.first.id);
      bookDetails.status = 'cancelled';
      await db.collection("bookings").doc(documentReference.docs.first.id).update(bookDetails.toJason());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> congirmCheckIn(BookDetails bookDetails) async {
    final documentReference = await db.collection("bookings").where("bid", isEqualTo: bookDetails.bid).get();
    print(documentReference.docs.first.id);
    if (documentReference.docs.isNotEmpty) {
      print(documentReference.docs.first.id);
      bookDetails.isCheckedIn = true;
      checkedInNotification.receiverId = bookDetails.uid;
      await db.collection("bookings").doc(documentReference.docs.first.id).update(bookDetails.toJason());
      await db.collection("hotels").doc(hotelDetailsGlobal.id).update({
        'stayegyDue': FieldValue.increment((bookDetails.totalPrice * 0.2).toInt() - (bookDetails.totalPrice - bookDetails.totalDiscountedPrice)),
        'currentEarnings': FieldValue.increment(bookDetails.totalPrice - (bookDetails.totalPrice * 0.2).toInt()),
        'totalEarnings': FieldValue.increment(bookDetails.totalPrice - (bookDetails.totalPrice * 0.2).toInt()),
        'totalCheckIns': FieldValue.increment(1),
      });
      await db.collection("notifications").doc().set(checkedInNotification.toJason());
      return true;
    } else {
      return false;
    }
  }
}
