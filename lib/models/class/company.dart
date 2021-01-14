import 'package:cloud_firestore/cloud_firestore.dart';

class Company {
  String _id, _companyName, _address, _contactNumber;
  Timestamp _createdAt, _nextBillingDate;
  Company(
      {String id,
      String companyName,
      String address,
      String contactNumber,
      Timestamp createdAt,
      Timestamp nextBillingDate}) {
    _id = id;
    _companyName = companyName;
    _address = address;
    _contactNumber = contactNumber;
    _createdAt = createdAt;
    _nextBillingDate = nextBillingDate;
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
}
