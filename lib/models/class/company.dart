import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/utils/constants.dart';

class Company {
  String _id;
  String get id => _id;
  set id(String value) => _id = value;

  String _companyName;
  String get companyName => _companyName;
  set companyName(String value) => _companyName = value;

  String _address;
  String get address => _address;
  set address(String value) => _address = value;

  String _contactNumber;
  String get contactNumber => _contactNumber;
  set contactNumber(String value) => _contactNumber = value;

  String _email;
  String get email => _email;
  set email(String value) => _email = value;

  Timestamp _createdAt;
  Timestamp get createdAt => _createdAt;
  set createdAt(Timestamp value) => _createdAt = value;

  Timestamp _nextBillingDate;
  Timestamp get nextBillingDate => _nextBillingDate;
  set nextBillingDate(Timestamp value) => _nextBillingDate = value;

  final _companyCollection = Constants.COMPANY_COLLECTION;
  User _user = User();
  Company(
      {String id,
      String companyName,
      String address,
      String contactNumber,
      Timestamp createdAt,
      Timestamp nextBillingDate,
      String email}) {
    _id = id;
    _companyName = companyName;
    _address = address;
    _contactNumber = contactNumber;
    _createdAt = createdAt;
    _nextBillingDate = nextBillingDate;
  }

  populateCompany(DocumentSnapshot doc) {
    _id = doc.id;
    final data = doc.data();
    _companyName = data['company_name'];
    _address = data['address'];
    _contactNumber = data['contact_number'];
    _createdAt = data['created_at'];
    _nextBillingDate = data['next_billing_date'];
  }

  getId() {
    return _id;
  }

  getCompanyName() {
    return _companyName;
  }

  getAddress() {
    return _address;
  }

  getContactNumber() {
    return _contactNumber;
  }

  getCreatedAt() {
    return _createdAt;
  }

  getNextBillingDate() {
    return _nextBillingDate;
  }

  Future<DocumentSnapshot> getCompanyNameByUserCurrentUser() async {
    String companyId = (await _user.currentUserDoc()).data()['company_id'];
    return _companyCollection.doc(companyId.trim()).get();
  }

  Future<DocumentSnapshot> getCompanyById(String id) async {
    return await _companyCollection.doc(id.trim()).get();
  }
}
