import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/models/class/company.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/utils/constants.dart';

class Auth {
  final _auth = Constants.AUTH;
  final _companyCollection = Constants.COMPANY_COLLECTION;
  final _userCollection = Constants.USER_COLLECTION;
  User _user = new User();

  Future<ResponseHandler> login(String email, String password) async {
    try {
      var userData = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      var loggedInUser = await _user.getUser(userData.user.uid);
      if (!loggedInUser.success) {
        return new ResponseHandler(false, 'Not Authorised to use this app');
      }
      return new ResponseHandler(true, '');
    } catch (e) {
      String message;
      switch (e.code) {
        case 'user-not-found':
          message = 'Record not found';
          break;
        case 'wrong-password':
          message = 'Wrong email or password';
          break;
        default:
          message = 'Wrong email or password';
          break;
      }
      return new ResponseHandler(false, message);
    }
  }

  logout() async {
    await _auth.signOut();
    Routes.navigator.popAndPushNamed(Routes.login);
  }

  Future<ResponseHandler> registerCompany(
      Company companyDetails, User userDetails) async {
    try {
      var signupRes = await signup(userDetails);
      if (signupRes.success) {
        String companyId = signupRes.data.uid;
        try {
          await _companyCollection.doc(companyId).set({
            'company_name': companyDetails.getCompanyName(),
            'address': companyDetails.getAddress(),
            'email': companyDetails.getAddress(),
            'created_at': Constants.DATE_NOW,
            'completed_registration': false
          });
          return new ResponseHandler(true, 'Account registered successfully');
        } catch (e) {
          return new ResponseHandler(false, e.message);
        }
      } else {
        return new ResponseHandler(false, signupRes.data);
      }
    } catch (e) {
      return new ResponseHandler(false, e.message);
    }
  }

  Future<ResponseData> signup(User userDetails) async {
    try {
      var user = await _auth.createUserWithEmailAndPassword(
          email: userDetails.getEmail(), password: userDetails.getPassword());
      try {
        await _userCollection.doc(user.user.uid).set({
          'name': userDetails.getName(),
          'email': userDetails.getEmail(),
          'created_at': Constants.DATE_NOW,
          'company_id': user.user.uid
        });
      } catch (e) {
        return new ResponseData(false, e.message);
      }
      return new ResponseData(true, user.user);
    } catch (e) {
      String message;
      switch (e.code) {
        case 'The account already exists for that email.':
          message = "The account already exists for that email.";
          break;
        default:
          message = e.message;
          break;
      }
      return new ResponseData(false, message);
    }
  }

  Future<void> checkAuth() async {
    if (_auth.currentUser != null) {
      ResponseData user = await _user.getUser(_auth.currentUser.uid);
      bool completedRegistration = user.data['completed_registration'];
      if (!completedRegistration) {
        Routes.navigator.pushReplacementNamed(Routes.packages);
      }
    }
  }

  Future<ResponseHandler> subscribe() async {}
}
