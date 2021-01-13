import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';

class SearchResults extends StatefulWidget {
  @override
  _SearchResultsState createState() => _SearchResultsState();
}

class _SearchResultsState extends State<SearchResults> {
  var _controller = TextEditingController();
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
              icon: Icon(Icons.clear),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              makeResults(fullname: 'John Doe', idNumnber: '892898 3766 087'),
              makeResults(fullname: 'John Doe', idNumnber: '892898 3766 087'),
              makeResults(fullname: 'John Doe', idNumnber: '892898 3766 087')
            ],
          ),
        ),
      ),
    );
  }

  Widget makeResults({fullname, idNumnber}) {
    return Column(
      children: [
        Material(
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
                      idNumnber,
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
                IconButton(
                  icon: Icon(
                    Icons.add_circle_outline,
                    color: mainOrange,
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
        SizedBox(height: 10.0),
      ],
    );
  }
}
