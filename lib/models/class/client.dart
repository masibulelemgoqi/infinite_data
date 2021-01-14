import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/utils/constants.dart';
import 'package:infinite_data/models/data/responseHandler.dart';

class Client {
  String _id, _name, _idNumber, _contactNumber;
  Timestamp _createdAt;
  final _clientCollection = Constants.CLIENT_COLLECTION;
  Client(
      {String id,
      String name,
      String idNumber,
      String contactNumber,
      Timestamp createdAt}) {
    _id = id;
    _name = name;
    _idNumber = idNumber;
    _contactNumber = contactNumber;
    _createdAt = createdAt;
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

  setClient(DocumentSnapshot client) {
    _id = client.id;
    var data = client.data();
    _name = data['name'];
    _contactNumber = data['contact_number'];
    _idNumber = data['id_number'];
    _createdAt = data['createdAt'];
  }

  Stream<DocumentSnapshot> getClient(id) {
    return _clientCollection.doc(id).snapshots();
  }

  Future<ResponseHandler> addClient(Client _client) async {
    var checkClient = await _clientCollection
        .where('id_number', isEqualTo: _client.getIdNumber())
        .get();
    if (checkClient.docs.isEmpty) {
      var userAdd = await _clientCollection.add({
        'name': _client.getName(),
        'id_number': _client.getIdNumber(),
        'contact_number': _client.getContactNumber(),
        'created_at': Constants.DATE_NOW
      });
      var userId = userAdd.id;
    }
  }
}
