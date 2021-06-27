import 'package:cloud_firestore/cloud_firestore.dart';

class BookDetails {
  String userName;
  String userPhoneNumber;
  int totalPrice;
  int totalDiscountedPrice;
  String bid;
  String hid;
  String hotelName;
  List roomsDiscountedPrice;
  List roomsPrice;
  List selectedRooms;
  String uid;
  Timestamp startDate;
  Timestamp endDate;
  String status;

  Map<String, dynamic> toJason() => {
        'userName': userName,
        'userPhoneNumber': userPhoneNumber,
        'totalPrice': totalPrice,
        'totalDiscountedPrice': totalDiscountedPrice,
        'bid': bid,
        'hid': hid,
        'hotelName': hotelName,
        'roomsDiscountedPrice': roomsDiscountedPrice,
        'roomsPrice': roomsPrice,
        'selectedRooms': selectedRooms,
        'uid': uid,
        'startDate': startDate,
        'endDate': endDate,
        'status': status,
      };

  BookDetails.fromMap(Map<String, dynamic> bookDetailsMap) {
    userName = bookDetailsMap["userName"];
    userPhoneNumber = bookDetailsMap["userPhoneNumber"];
    totalPrice = bookDetailsMap["totalPrice"];
    totalDiscountedPrice = bookDetailsMap["totalDiscountedPrice"];
    bid = bookDetailsMap["bid"];
    hid = bookDetailsMap["hid"];
    hotelName = bookDetailsMap["hotelName"];
    roomsDiscountedPrice = bookDetailsMap["roomsDiscountedPrice"];
    roomsPrice = bookDetailsMap["roomsPrice"];
    selectedRooms = bookDetailsMap["selectedRooms"];
    uid = bookDetailsMap["uid"];
    startDate = bookDetailsMap["startDate"];
    endDate = bookDetailsMap["endDate"];
    status = bookDetailsMap["status"];
  }
}
