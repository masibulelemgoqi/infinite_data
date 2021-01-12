import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/utils/constants.dart';

class User {
  String _id, _name, _email, _password, _companyId;

  User({id, name, email, password, companyId}) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _companyId = companyId;
  }

  populateUser(DocumentSnapshot user) {
    var id = user.id;
    var data = user.data();
    User(
        companyId: data['company_id'],
        id: id,
        email: data['email'],
        name: data['name']);
  }

  getId() {
    return _id;
  }

  getName() {
    return _name;
  }

  getEmail() {
    return _email;
  }

  getCompanyId() {
    return _companyId;
  }

  getPassword() {
    return this._password;
  }

  Future<ResponseData> getUser(id) async {
    var _user = await Constants.USER_COLLECTION.doc(id).get();
    if (_user.exists) {
      return new ResponseData(true, _user.data());
    } else {
      return new ResponseData(false, {});
    }
  }

  Stream<DocumentSnapshot> getCurrentUser() {
    return Constants.USER_COLLECTION
        .doc(Constants.AUTH.currentUser.uid)
        .snapshots();
  }
}
