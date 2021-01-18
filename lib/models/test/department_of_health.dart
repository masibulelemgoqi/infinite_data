import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/ResponseData.dart';

class DepartmentOfHealth {
  String _name;
  String get name => _name;
  set name(String value) => _name = value;

  String _idNumber;
  String get idNumber => _idNumber;
  set idNumber(String value) => _idNumber = value;

  String _status;
  String get status => _status;
  set status(String value) => _status = value;

  Timestamp _dateTested;
  Timestamp get dateTested => _dateTested;
  set dateTested(Timestamp dateTested) => _dateTested = dateTested;
  DepartmentOfHealth({name, idNumber, status, dateTested}) {
    _name = name;
    _idNumber = idNumber;
    _status = status;
    _dateTested = dateTested;
  }

  Future<ResponseData> searchPerson({String idNumber, String name}) async {
    List<DepartmentOfHealth> person = people.where(
        (element) => element._idNumber == idNumber || element._name == name);
    if (person.length > 0) {
      return new ResponseData(true, person[0]);
    }
    return new ResponseData(false, 'Never tested');
  }

  List<DepartmentOfHealth> get people => [
        new DepartmentOfHealth(
            dateTested: '15/12/2020',
            idNumber: '9101015432106',
            name: 'John Doe',
            status: 'Negative'),
        new DepartmentOfHealth(
            dateTested: '03/01/2021',
            idNumber: '0001015432106',
            name: 'Jane Doe',
            status: 'Positive'),
      ];
}
