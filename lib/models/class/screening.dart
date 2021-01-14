import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/utils/constants.dart';

class Screening {
  String _id, _status, _companyId, _clientId;
  Timestamp _createdAt;
  double _temperature;
  var _screeningCollection = Constants.SCREENING_COLLECTION;

  Screening({id, status, temperature, companyId, clientId, createdAt}) {
    _clientId = clientId;
    _id = id;
    _status = status;
    _temperature = temperature;
    _companyId = companyId;
    _createdAt = createdAt;
  }

  getId() {
    return _id;
  }

  getStatus() {
    return _status;
  }

  getTemperature() {
    return _temperature;
  }

  getCompanyId() {
    return _companyId;
  }

  getClientId() {
    return _clientId;
  }

  getCreatedAt() {
    return _createdAt;
  }

  Stream<QuerySnapshot> getScreening(String clientId) {
    return Constants.SCREENING_COLLECTION
        .where('client_id', isEqualTo: clientId)
        .orderBy('created_at')
        .limit(3)
        .snapshots();
  }

  populateScreening({id, clientId, companyId, temperature, status, createdAt}) {
    _id = id;
    _clientId = clientId;
    _companyId = companyId;
    _temperature = temperature;
    _status = status;
    _createdAt = createdAt;
  }

  Future<ResponseHandler> addScreening(Screening _screening) async {
    try {
      await _screeningCollection.add({
        'client_id': _screening.getClientId(),
        'company_id': _screening.getCompanyId(),
        'temperature': _screening.getTemperature(),
        'status': _screening.getStatus(),
        'created_at': Constants.DATE_NOW
      });

      return ResponseHandler(true, 'Reading added succesfully');
    } catch (e) {
      return ResponseHandler(false, e.message);
    }
  }
}
