import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/animations/fade_animation.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/auth.dart';
import 'package:infinite_data/models/class/client.dart';
import 'package:infinite_data/models/data/ResponseData.dart';
import 'package:infinite_data/models/data/SearchHandler.dart';
import 'package:infinite_data/models/test/department_of_health.dart';
import 'package:infinite_data/routes/routes.gr.dart';
import 'package:infinite_data/views/search_results.dart';

class SearchHome extends StatefulWidget {
  @override
  _SearchHomeState createState() => _SearchHomeState();
}

class _SearchHomeState extends State<SearchHome> {
  TextEditingController _searchText = TextEditingController();
  Auth _auth = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: backgroundColor,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
            size: 20.0,
            color: darkColor,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 100.0),
              FadeAnimation(
                0.8,
                Text(
                  'Find Customer',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.0),
              FadeAnimation(
                1,
                Text(
                  'Search customer by ID Number or Full Name. If never registered click register to add.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: textColor,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 50.0),
              FadeAnimation(
                1.2,
                Material(
                  elevation: 3,
                  borderRadius: BorderRadius.circular(50.0),
                  child: Form(
                    child: TextFormField(
                      controller: _searchText,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(15.0),
                        fillColor: Colors.white,
                        hintText: 'Search Customer...',
                        hintStyle: TextStyle(color: hintColor),
                        border: InputBorder.none,
                        suffixIcon: Icon(
                          Icons.search,
                          color: textColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              FadeAnimation(
                1.4,
                MaterialButton(
                  height: 50.0,
                  elevation: 1,
                  color: mainBlue,
                  onPressed: () {
                    _searchPerson();
                    // Routes.navigator.pushNamed(Routes.searchResults);
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Text(
                    'Find Customer',
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
        ),
      ),
    );
  }

  void _searchPerson() async {
    String _keyWords = _searchText.text.trim();
    if (_keyWords.isNotEmpty) {
      Client _client = Client();
      SearchHandler _results = await _client.searchClient(keyWord: _keyWords);
      if (_results.success) {
        Routes.navigator.pushNamed(Routes.searchResults, arguments: _results);
      }
    }
  }
}
