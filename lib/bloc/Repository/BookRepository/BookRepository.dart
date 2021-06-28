import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/constants/constant.dart';

class BookRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List> getBookedList() async {
    List<BookDetails> bookedList = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').get();

    print("booked length ${querySnapshot.docs.length}, hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      bookedList.add(BookDetails.fromMap(querySnapshot.docs[i].data()));
      print("${querySnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return bookedList;
  }

// .where("isAccepted", isEqualTo: true)
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

  Future<List> getFreeRooms(BookDetails bookDetails) async {
    List bookedRooms = [];

    print(bookDetails.startDate);
    print(bookDetails.endDate);
    print(Timestamp.fromMillisecondsSinceEpoch(bookDetails.startDate.seconds));
    print(Timestamp.fromMillisecondsSinceEpoch(bookDetails.endDate.seconds));
    // QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('bookedRooms', isNotEqualTo: null).where('startDate', isGreaterThanOrEqualTo: bookDetails.startDate).where('endDate', isLessThanOrEqualTo: bookDetails.endDate).get();
    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('bookedRooms', isNotEqualTo: null).where('startDate', isGreaterThanOrEqualTo: bookDetails.startDate).get();
    // QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('bookedRooms', isNotEqualTo: null).get();

    print("freerooms length ${querySnapshot.docs.length}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      if (querySnapshot.docs[i].data()['endDate'].toDate().isBefore(bookDetails.endDate.toDate())) {
        bookedRooms.add(querySnapshot.docs[i].data()['bookedRooms']);
        print(bookedRooms);
      }
    }

    Set setbooked = Set.from(bookedRooms);
    Set setAll = Set.from(hotelDetailsGlobal.rooms);

    return List.from(setAll.difference(setbooked));
  }
}
