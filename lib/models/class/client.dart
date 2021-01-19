import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/SearchHandler.dart';
import 'package:infinite_data/models/test/department_of_health.dart';
import 'package:infinite_data/models/test/home_affairs.dart';
import 'package:infinite_data/utils/constants.dart';
import 'package:infinite_data/models/data/responseHandler.dart';

class Client {
  String _id, _name, _idNumber, _contactNumber;
  Timestamp _createdAt;
  final _clientCollection = Constants.CLIENT_COLLECTION;
  bool _isOnDb;
  bool get isOnDb => _isOnDb;

  set isOnDb(bool value) => _isOnDb = value;

  Client(
      {String id,
      String name,
      String idNumber,
      String contactNumber,
      Timestamp createdAt,
      bool isOnDb}) {
    _id = id;
    _name = name;
    _idNumber = idNumber;
    _contactNumber = contactNumber;
    _createdAt = createdAt;
    _isOnDb = isOnDb;
  }

  String getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getIdNumber() {
    return _idNumber;
  }

  String getContactNumber() {
    return _contactNumber;
  }

  setClient(DocumentSnapshot client) {
    _id = client.id;
    var data = client.data();
    _name = data['name'];
    _contactNumber =
        data.containsKey('contact_number') ? data['contact_number'] : '';
    _idNumber = data['id_number'];
    _createdAt = data['createdAt'];
    _isOnDb = true;
  }

  Stream<DocumentSnapshot> getClient(id) {
    return _clientCollection.doc(id).snapshots();
  }

  Stream<QuerySnapshot> getClientByIdNumber({String idNumber}) {
    return _clientCollection
        .where('id_number', isEqualTo: idNumber.trim())
        .snapshots();
  }

  Future<ResponseHandler> addClient(Client _client) async {
    try {
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
        return ResponseHandler(true, 'User added successfully');
        // var userId = userAdd.id;
      }
      return ResponseHandler(false, 'User already exists');
    } catch (e) {
      return ResponseHandler(false, e.message);
    }
  }

  Future<SearchHandler> searchClient({String keyWord}) async {
    keyWord = keyWord.trim();
    if (keyWord.contains(' ')) {
      List keys = keyWord.split(' ');

      String firstname = keys[0].toString().substring(0, 1).toUpperCase() +
          keys[0]
              .toString()
              .substring(1, keys[0].toString().length)
              .toLowerCase();
      String lastname = keys[1].toString().substring(0, 1).toUpperCase() +
          keys[1]
              .toString()
              .substring(1, keys[1].toString().length)
              .toLowerCase();
      keyWord = firstname + ' ' + lastname;
    }
    QuerySnapshot idCheck = await Constants.CLIENT_COLLECTION
        .where('id_number', isEqualTo: keyWord)
        .get();
    QuerySnapshot nameCheck;
    if (idCheck.docs.length == 0) {
      nameCheck = await Constants.CLIENT_COLLECTION
          .where('name', isEqualTo: keyWord)
          .get();
    }

    if (idCheck.docs.length == 0 && nameCheck.docs.length == 0) {
      DepartmentOfHealth _doh = DepartmentOfHealth();
      SearchHandler dohData = await _doh.searchPerson(keyWord: keyWord);
      if (dohData.success) {
        return dohData;
      }
      HomeAffairs _ha = HomeAffairs();
      SearchHandler haData = await _ha.searchPerson(keyWord: keyWord);

      if (haData.success) {
        return haData;
      }

      return SearchHandler(false, SearchSource.NO_SOURCE, 'User not found');
    }
    return SearchHandler(true, SearchSource.OUR_DB,
        idCheck.docs.length > 0 ? idCheck : nameCheck);
  }
}
