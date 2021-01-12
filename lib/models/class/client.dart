class ClientData {
  String _id, _name, _idNumber, _contactNumber;
  ClientData({String id, String name, String idNumber, String contactNumber}) {
    _id = id;
    _name = name;
    _idNumber = idNumber;
    _contactNumber = contactNumber;
  }

  getId() {
    return _id;
  }

  getName() {
    return _name;
  }

  getIdNumber() {
    return _idNumber;
  }

  getContactNumber() {
    return _contactNumber;
  }
}
