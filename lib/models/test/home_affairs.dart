import 'package:infinite_data/models/data/ResponseData.dart';

class HomeAffairs {
  String _name;
  String get name => _name;
  set name(String value) => _name = value;

  String _idNumber;
  String get idNumber => _idNumber;
  set idNumber(String value) => _idNumber = value;

  HomeAffairs({name, idNumber}) {
    _name = name;
    _idNumber = idNumber;
  }

  Future<ResponseData> searchWithIdNumber(
      {String name, String idNumber}) async {
    List<HomeAffairs> user = people.where(
        (element) => element._idNumber == idNumber || element._name == name);
    if (user.length > 0) {
      return new ResponseData(true, user[0]);
    }
    return new ResponseData(false, '');
  }

  List<HomeAffairs> get people => [
        new HomeAffairs(idNumber: '0202106543211', name: "Sean Doe"),
        new HomeAffairs(idNumber: '9810155964086', name: "Masibulele Mgoqi"),
      ];
}
