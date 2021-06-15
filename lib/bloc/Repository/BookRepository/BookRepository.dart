import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';
import 'package:stayegy_host/constants/constant.dart';

class BookRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List> getBookedList() async {
    List<BookDetails> bookedList = [];

    QuerySnapshot querySnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('isAccepted', isEqualTo: true).get();

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

    QuerySnapshot pendingSnapshot = await db.collection("bookings").where('hid', isEqualTo: hotelDetailsGlobal.hid).where('isAccepted', isEqualTo: false).get();
    print("pending length ${pendingSnapshot.docs.length} , hid: ${hotelDetailsGlobal.hid}");
    for (int i = 0; i < pendingSnapshot.docs.length; i++) {
      pendingList.add(BookDetails.fromMap(pendingSnapshot.docs[i].data()));
      print("${pendingSnapshot.docs.first.toString()} ++++ has been added to booked list!");
    }

    return pendingList;
  }
}
