import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/utils/constants.dart';

class User {
  String _id, _name, _email, _password, _companyId;
  Timestamp _createdAt;
  bool _completedRegistration;

  User(
      {id,
      name,
      email,
      password,
      companyId,
      createdAt,
      completedRegistration}) {
    _id = id;
    _name = name;
    _email = email;
    _password = password;
    _companyId = companyId;
    _createdAt = createdAt;
    _completedRegistration = completedRegistration;
  }

  String getId() {
    return _id;
  }

  String getName() {
    return _name;
  }

  String getEmail() {
    return _email;
  }

  String getCompanyId() {
    return _companyId;
  }

  String getPassword() {
    return this._password;
  }

  Timestamp getCreatedAt() {
    return _createdAt;
  }

  bool getCompletedRegistration() {
    return _completedRegistration;
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

  populateUser(DocumentSnapshot user) {
    var id = user.id;
    var data = user.data();
    bool cR = data.containsKey('completed_registration')
        ? data['completed_registration']
        : false;
    _companyId = data['company_id'].toString().trim();
    _id = id.toString().trim();
    _email = data['email'].toString().trim();
    _name = data['name'].toString().trim();
    _createdAt = data['created_at'];
    _completedRegistration = cR;
  }
}
