// Department of health data
import 'package:cloud_firestore/cloud_firestore.dart';

class Department {
  String _idNumber, _status;
  Timestamp _createdAt;

  Department({idNumber, status, createdAt}) {
    _idNumber = idNumber;
    _status = status;
    _createdAt = createdAt;
  }

  String getIdNumber() {
    return _idNumber;
  }

  String getStatus() {
    return _status;
  }

  Timestamp getCreatedAt() {
    return _createdAt;
  }

  getDepartmentData() async {
    // TODO
  }
}
