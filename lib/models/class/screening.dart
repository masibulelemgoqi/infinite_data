import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/utils/constants.dart';

class Screening {
  String _id;
  String get id => _id;

  set id(String value) => _id = value;
  String _status;
  String get status => _status;

  set status(String value) => _status = value;
  String _companyId;
  String get companyId => _companyId;

  set companyId(String value) => _companyId = value;
  String _clientId;
  String get clientId => _clientId;

  set clientId(String value) => _clientId = value;
  Timestamp _createdAt;
  Timestamp get createdAt => _createdAt;

  set createdAt(Timestamp value) => _createdAt = value;
  double _temperature;
  double get temperature => _temperature;

  set temperature(double value) => _temperature = value;
  var _screeningCollection = Constants.SCREENING_COLLECTION;

  Screening({id, status, temperature, companyId, clientId, createdAt}) {
    _clientId = clientId;
    _id = id;
    _status = status;
    _temperature = temperature;
    _companyId = companyId;
    _createdAt = createdAt;
  }

  Stream<QuerySnapshot> getScreening(String clientId) {
    return Constants.SCREENING_COLLECTION
        .where('client_id', isEqualTo: clientId.trim())
        .orderBy('created_at', descending: true)
        .limit(1)
        .snapshots();
  }

  populateScreening(DocumentSnapshot doc) {
    _id = doc.id;
    var data = doc.data();
    _clientId = data['client_id'];
    _companyId = data['company_id'];
    _temperature = data['temperature'];
    _status = data['status'];
    _createdAt = data['created_at'];
  }

  Future<ResponseHandler> addScreening(Screening _screening) async {
    try {
      await _screeningCollection.add({
        'client_id': _screening.clientId,
        'company_id': _screening.companyId,
        'temperature': _screening.temperature,
        'status': _screening.status,
        'created_at': Constants.DATE_NOW
      });

      return ResponseHandler(true, 'Reading added succesfully');
    } catch (e) {
      return ResponseHandler(false, e.message);
    }
  }
}
