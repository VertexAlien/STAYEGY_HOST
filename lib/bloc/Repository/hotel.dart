import 'dart:ffi';

class Hotel {
  String hid;
  String name;
  int rooms;
  String address;

  List closedRooms;
  List bookedRooms;

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'rooms': rooms,
        'address': address,
        'closedRooms': closedRooms,
        'bookedRooms': bookedRooms,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    rooms = hotelMap["rooms"];
    address = hotelMap["address"];
    closedRooms = hotelMap["closedRooms"];
    bookedRooms = hotelMap["bookedRooms"];
  }
}
