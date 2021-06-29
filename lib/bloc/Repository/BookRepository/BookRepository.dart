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
    List output = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('status', isEqualTo: 'booked').where('endDate', isGreaterThanOrEqualTo: bookDetails.startDate).get();

    print("bookedrooms length ${querySnapshot.docs.length}");
    for (int i = 0; i < querySnapshot.docs.length; i++) {
      print(querySnapshot.docs[i].data()['startDate'].toDate());
      print(bookDetails.endDate.toDate());

      if (querySnapshot.docs[i].data()['startDate'].toDate().isBefore(bookDetails.endDate.toDate()) || querySnapshot.docs[i].data()['endDate'].toDate() == bookDetails.startDate.toDate()) {
        bookedRooms.add(querySnapshot.docs[i].data()['bookedRooms']);
        if (querySnapshot.docs[i].data()['endDate'].toDate() == bookDetails.startDate.toDate()) {
          List templist = querySnapshot.docs[i].data()['bookedRooms'];
          templist.forEach((element) {
            output.add(element);
          });
          print('freerooms same date $output');
        }
        print('booked rooms $bookedRooms');
        print('executed');
      }
    }

    hotelDetailsGlobal.rooms.forEach((element) {
      if (bookedRooms.contains(element)) {
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
      await db.collection("bookings").doc(documentReference.docs.first.id).update(bookDetails.toJason());
      return true;
    } else {
      return false;
    }
  }
}
