import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/user.dart';
import 'package:infinite_data/models/class/company.dart';
import 'package:infinite_data/models/data/responseHandler.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/utils/validator.dart';
import 'package:infinite_data/views/widgets/create_input.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  Validator _validator = new Validator();
  Auth _auth = new Auth();
  TextEditingController _companyNameController = new TextEditingController();
  TextEditingController _addressController = new TextEditingController();
  TextEditingController _emailController = new TextEditingController();
  TextEditingController _contactNumberController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();
  TextEditingController _verifyPasswordController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            size: 20.0,
            color: darkColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FadeAnimation(
                      0.8,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Infinite',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.0),
                          Text(
                            'Data',
                            style: GoogleFonts.roboto(
                              textStyle: TextStyle(
                                fontSize: 38,
                                fontWeight: FontWeight.w900,
                                color: mainBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    FadeAnimation(
                      1,
                      Text(
                        'Register',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  FadeAnimation(
                    1.2,
                    makeInput(
                        label: 'Company Name',
                        editingController: _companyNameController),
                  ),
                  FadeAnimation(
                    1.4,
                    makeInput(
                        label: 'Company Address',
                        editingController: _addressController),
                  ),
                  FadeAnimation(
                    1.8,
                    makeInput(
                        label: 'Email', editingController: _emailController),
                  ),
                  FadeAnimation(
                    2,
                    makeInput(
                        label: 'Contact No.',
                        editingController: _contactNumberController),
                  ),
                  FadeAnimation(
                    2.2,
                    makeInput(
                        label: 'Password',
                        obscureText: true,
                        editingController: _passwordController),
                  ),
                  FadeAnimation(
                    2.4,
                    makeInput(
                        label: 'Confirm Password',
                        obscureText: true,
                        editingController: _verifyPasswordController),
                  ),
                  SizedBox(height: 20.0),
                  FadeAnimation(
                    2.6,
                    MaterialButton(
                      height: 50.0,
                      elevation: 1,
                      color: darkBlue,
                      onPressed: () {
                        addCompany();
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50.0),
                      ),
                      child: Text(
                        'Register',
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 60.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FadeAnimation(
                    2,
                    Text(
                      "Already have an accout?",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 16,
                          color: darkColor,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5.0),
                  FadeAnimation(
                    2.2,
                    GestureDetector(
                      onTap: () {
                        Routes.navigator.pushNamed(Routes.login);
                      },
                      child: Text(
                        "Login",
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 16,
                            color: darkColor,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  addCompany() async {
    String companyName = _companyNameController.text;
    String email = _emailController.text;
    String address = _addressController.text;
    String contactNumber = _contactNumberController.text;
    String password = _passwordController.text;
    String verifyPassword = _verifyPasswordController.text;
    if (!_validator.validName(companyName).success) {
      print(_validator.validName(companyName).message);
      return;
    }
    if (!_validator.validAddress(address).success) {
      print(_validator.validAddress(address).message);
      return;
    }
    if (!_validator.validEmail(email).success) {
      print(_validator.validEmail(email).message);
      return;
    }
    if (!_validator.validContactNumber(contactNumber).success) {
      print(_validator.validContactNumber(contactNumber).message);
      return;
    }
    if (!_validator
        .validPassword(password: password, verifyPassword: verifyPassword)
        .success) {
      print(_validator
          .validPassword(password: password, verifyPassword: verifyPassword)
          .message);
      return;
    }
    Company company = Company(
        address: address,
        companyName: companyName,
        contactNumber: contactNumber);
    User user = User(
        companyId: '', email: email, name: companyName, password: password);
    ResponseHander result = await _auth.registerCompany(company, user);

    if (result.success) {
      Routes.navigator.pushReplacementNamed(Routes.packages);
    } else {
      print(result.message);
    }
  }
}
