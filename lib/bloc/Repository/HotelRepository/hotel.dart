import 'package:cloud_firestore/cloud_firestore.dart';

class Hotel {
  String id;
  String hid;
  String name;
  String address;
  List rooms = [];
  Map roomPrices;
  Timestamp dueClearedDate;
  int stayegyDue;
  int currentEarnings;
  int totalCheckIns;
  int totalReaches;
  int totalEarnings;

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'address': address,
        'rooms': rooms,
        'price': roomPrices,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    id = hotelMap["id"];
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    address = hotelMap["address"];
    rooms = hotelMap["rooms"];
    roomPrices = hotelMap["price"];
    dueClearedDate = hotelMap["dueClearedDate"];
    stayegyDue = hotelMap["stayegyDue"];
    currentEarnings = hotelMap["currentEarnings"];
    totalCheckIns = hotelMap["totalCheckIns"];
    totalReaches = hotelMap["totalReaches"];
    totalEarnings = hotelMap["totalEarnings"];
  }
}
