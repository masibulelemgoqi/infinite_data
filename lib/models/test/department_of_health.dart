import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/SearchHandler.dart';

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

  String _dateTested;
  String get dateTested => _dateTested;
  set dateTested(String dateTested) => _dateTested = dateTested;
  DepartmentOfHealth({name, idNumber, status, dateTested}) {
    _name = name;
    _idNumber = idNumber;
    _status = status;
    _dateTested = dateTested;
  }

  Future<SearchHandler> searchPerson({String keyWord}) async {
    List<DepartmentOfHealth> person = people
        .where((element) =>
            element._idNumber == keyWord || element._name == keyWord)
        .toList();
    if (person.length > 0) {
      return new SearchHandler(true, SearchSource.DEPARTMENT_OF_HEALTH, person);
    }
    return new SearchHandler(false, SearchSource.DEPARTMENT_OF_HEALTH, []);
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
