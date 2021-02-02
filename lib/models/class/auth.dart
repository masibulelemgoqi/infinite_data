import 'package:infinite_data/models/class/package.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/models/class/company.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/utils/constants.dart';

class Auth {
  final _auth = Constants.AUTH;
  String _authId = Constants.AUTH.currentUser?.uid;
  String get authId => _authId;
  final _companyCollection = Constants.COMPANY_COLLECTION;
  final _userCollection = Constants.USER_COLLECTION;
  User _user = new User();

  Future<ResponseHandler> login(String email, String password) async {
    try {
      var userData = await _auth.signInWithEmailAndPassword(
          email: email.trim(), password: password.trim());
      var loggedInUser = await _user.getUser(userData.user.uid);
      if (!loggedInUser.success) {
        return new ResponseHandler(false, 'Not Authorised to use this app');
      }

      return new ResponseHandler(true, '');
    } catch (e) {
      print(e);
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
    Routes.navigator.pushNamedAndRemoveUntil(Routes.login, (route) => false);
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
            'email': userDetails.getEmail(),
            'created_at': Constants.DATE_NOW
          });

          await _userCollection
              .doc(companyId)
              .update({'completed_registration': false});
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

  Future<ResponseHandler> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      return ResponseHandler(true, 'Email Reset link is sent to your email');
    } catch (e) {
      return ResponseHandler(false, e.message);
    }
  }

  Future<ResponseHandler> subscribe(Package package) async {
    try {
      await _userCollection.doc(_auth.currentUser.uid).update({
        'next_billing_date': Constants.DATE_NOW,
        'package_id': package.getId(),
        'completed_registration': true
      });
      return new ResponseHandler(true, 'Subscribed successfully');
    } catch (e) {
      return new ResponseHandler(false, e.message);
    }
  }
}
