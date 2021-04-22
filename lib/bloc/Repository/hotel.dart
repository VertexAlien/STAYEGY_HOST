import 'dart:ffi';

class Hotel {
  String hid;
  String name;
  int rooms;
  String address;

  List closeRooms;
  List bookedRooms;

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'rooms': rooms,
        'address': address,
        'closeRooms': closeRooms,
        'bookedRooms': bookedRooms,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    rooms = hotelMap["rooms"];
    address = hotelMap["address"];
    closeRooms = hotelMap["closeRooms"];
    bookedRooms = hotelMap["bookedRooms"];
  }
}
