import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:stayegy_host/bloc/Repository/BookRepository/BookDetails.dart';

class BookRepository {
  FirebaseFirestore db = FirebaseFirestore.instance;

  Future<List> getBookedList({@required String hid}) async {
    List<BookDetails> bookedList = [];

    QuerySnapshot bookedSnapshot = await db.collection("bookings").where("hid", arrayContains: [hid]).where("isAccepted", isEqualTo: true).get();

    for (int i = 0; i < bookedSnapshot.docs.length; i++) {
      bookedList.add(BookDetails.fromMap(bookedSnapshot.docs[i].data()));
    }

    return bookedList;
  }

  Future<List> getPendingList({@required String hid}) async {
    List<BookDetails> pendingList = [];

    QuerySnapshot pendingSnapshot = await db.collection("bookings").where("hid", arrayContains: [hid]).where("isAccepted", isEqualTo: false).get();

    for (int i = 0; i < pendingSnapshot.docs.length; i++) {
      pendingList.add(BookDetails.fromMap(pendingSnapshot.docs[i].data()));
    }

    return pendingList;
  }
}
