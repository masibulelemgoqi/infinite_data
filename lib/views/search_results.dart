import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/models/class/client.dart';
import 'package:infinite_data/models/data/SearchHandler.dart';
import 'package:infinite_data/models/test/department_of_health.dart';
import 'package:infinite_data/models/test/home_affairs.dart';
import 'package:infinite_data/routes/routes.gr.dart';

class SearchResults extends StatefulWidget {
  final SearchHandler searchHandler;
  const SearchResults({@required this.searchHandler});
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  var _controller = TextEditingController();
  SearchHandler _searchHandler;
  Client _client = Client();
  DepartmentOfHealth _departmentOfHealth = DepartmentOfHealth();
  HomeAffairs _homeAffairs = HomeAffairs();
  List<DepartmentOfHealth> _doh = [];
  List<HomeAffairs> _ha = [];

  @override
  void initState() {
    _searchHandler = widget.searchHandler;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
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
        titleSpacing: 0,
        title: TextField(
          controller: _controller,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 15.0, left: 0),
            fillColor: Colors.white,
            hintText: 'Search Customer...',
            hintStyle: TextStyle(color: hintColor),
            border: InputBorder.none,
            suffixIcon: IconButton(
              onPressed: () => _controller.clear(),
              icon: Icon(
                Icons.clear,
                color: darkOrange,
              ),
            ),
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: handleClient(),
      ),
    );
  }

  Widget handleClient() {
    print(_searchHandler.source);
    switch (_searchHandler.source) {
      case 'department_of_health':
        _doh = _searchHandler.data as List<DepartmentOfHealth>;
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: _doh.length,
          itemBuilder: (ctx, index) {
            var person = _doh[index];
            return makeResults(
                fullname: person.name,
                idNumber: person.idNumber,
                isOnDb: person.isOnDb,
                index: index);
          },
        );
        break;
      case 'home_affairs':
        _ha = _searchHandler.data as List<HomeAffairs>;
        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: _ha.length,
          itemBuilder: (ctx, index) {
            var person = _ha[index];
            return makeResults(
                fullname: person.name,
                idNumber: person.idNumber,
                isOnDb: person.isOnDb,
                index: index);
          },
        );
        break;
      case 'our_db':
        QuerySnapshot _clientQuery = _searchHandler.data as QuerySnapshot;

        return ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: _clientQuery.docs.length,
          itemBuilder: (ctx, index) {
            DocumentSnapshot person =
                _clientQuery.docs[index] as DocumentSnapshot;
            _client.setClient(person);
            return makeResults(
                fullname: _client.getName(),
                idNumber: _client.getIdNumber(),
                isOnDb: _client.isOnDb);
          },
        );
        break;
      default:
        return Container();
        break;
    }
  }

  Widget makeResults({fullname, idNumber, isOnDb, index}) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Routes.navigator
                .pushNamed(Routes.viewCustomer, arguments: idNumber);
          },
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
              ),
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        fullname,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        idNumber,
                        style: GoogleFonts.roboto(
                          textStyle: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                            color: textColor,
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 10.0),
                  !isOnDb
                      ? IconButton(
                          icon: Icon(
                            Icons.add_circle_outline,
                            color: mainOrange,
                          ),
                          onPressed: () async {
                            Client _person =
                                Client(idNumber: idNumber, name: fullname);
                            await _person.addClient(_person);
                            if (_searchHandler.source ==
                                SearchSource.DEPARTMENT_OF_HEALTH) {
                              _doh[index].isOnDb = true;
                            } else if (_searchHandler.source ==
                                SearchSource.HOME_AFFAIRS) {
                              _ha[index].isOnDb = true;
                            }
                            setState(() {});
                          },
                        )
                      : SizedBox.shrink()
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
