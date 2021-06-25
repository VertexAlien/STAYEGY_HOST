class Hotel {
  String hid;
  String name;
  String address;
  List rooms = [];

  Map<String, dynamic> toJason() => {
        'hid': hid,
        'name': name,
        'address': address,
        'rooms': rooms,
      };

  Hotel.fromMap(Map<String, dynamic> hotelMap) {
    hid = hotelMap["hid"];
    name = hotelMap["name"];
    address = hotelMap["address"];
    rooms = hotelMap["rooms"];
  }
}
