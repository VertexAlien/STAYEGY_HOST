class Hotel {
  String hid;
  String name;
  Map rooms;
  String address;

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'rooms': rooms,
        'address': address,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    rooms = hotelMap["rooms"];
    address = hotelMap["address"];
  }
}
