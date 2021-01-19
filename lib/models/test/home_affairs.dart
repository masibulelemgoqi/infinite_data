import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/models/data/SearchHandler.dart';

class HomeAffairs {
  String _name;
  String get name => _name;
  set name(String value) => _name = value;

  String _idNumber;
  String get idNumber => _idNumber;
  set idNumber(String value) => _idNumber = value;

  bool _isOnDb;
  bool get isOnDb => _isOnDb;

  set isOnDb(bool value) => _isOnDb = value;

  HomeAffairs({name, idNumber, isOnDb}) {
    _name = name;
    _idNumber = idNumber;
    _isOnDb = isOnDb;
  }

  Future<SearchHandler> searchPerson({String keyWord}) async {
    List<HomeAffairs> user = people
        .where((element) =>
            element._idNumber == keyWord || element._name == keyWord)
        .toList();
    if (user.length > 0) {
      return new SearchHandler(
        true,
        SearchSource.HOME_AFFAIRS,
        user,
      );
    }
    return new SearchHandler(false, SearchSource.HOME_AFFAIRS, []);
  }

  List<HomeAffairs> get people => [
        new HomeAffairs(
            idNumber: '0202106543211', name: "Sean Doe", isOnDb: false),
        new HomeAffairs(
            idNumber: '9810155964086', name: "Masibulele Mgoqi", isOnDb: false),
      ];
}
