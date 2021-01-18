import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_data/helpers/helper.dart';
import 'package:infinite_data/views/add_temperature.dart';
import 'package:infinite_data/views/widgets/previous_temp.dart';
import 'package:page_transition/page_transition.dart';

class ViewCustomer extends StatefulWidget {
  @override
  _ViewCustomerState createState() => _ViewCustomerState();
}

class _ViewCustomerState extends State<ViewCustomer>
    with TickerProviderStateMixin {
  AnimationController rippleController;
  AnimationController scaleController;

  Animation<double> rippleAnimation;
  Animation<double> scaleAnimation;

  @override
  void initState() {
    super.initState();

    rippleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    scaleController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    rippleAnimation =
        Tween<double>(begin: 80.0, end: 90.0).animate(rippleController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              rippleController.reverse();
            } else if (status == AnimationStatus.dismissed) {
              rippleController.forward();
            }
          });

    scaleAnimation =
        Tween<double>(begin: 1.0, end: 20.0).animate(scaleController);

    rippleController.forward();
  }

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
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 70.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            makeTemperature(temperature: '36.7'),
            SizedBox(height: 30.0),
            Column(
              children: [
                Text(
                  'John Doe',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      fontWeight: FontWeight.w700,
                      color: Colors.black,
                    ),
                  ),
                ),
                Text(
                  '872983 2988 08 8',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 20.0,
                      color: darkColor,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  '083 459 9384',
                  style: GoogleFonts.roboto(
                    textStyle: TextStyle(
                      fontSize: 18.0,
                      color: textColor,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: mainOrange,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Department of Health status',
                    style: GoogleFonts.roboto(
                      textStyle: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Center(
                    child: Text(
                      'Never Tested',
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 50),
            Align(
              alignment: Alignment.bottomCenter,
              child: AnimatedBuilder(
                animation: rippleAnimation,
                builder: (context, child) => Container(
                  width: rippleAnimation.value,
                  height: rippleAnimation.value,
                  child: Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: mainBlue.withOpacity(.4)),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            type: PageTransitionType.fade,
                            child: AddTemperature(),
                          ),
                        );
                      },
                      child: AnimatedBuilder(
                        animation: scaleAnimation,
                        builder: (context, child) => Transform.scale(
                          scale: scaleAnimation.value,
                          child: Container(
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: mainBlue),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
