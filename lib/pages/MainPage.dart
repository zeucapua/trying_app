import 'package:flutter/material.dart';
import 'package:trying_app/models/Entry.dart';
import 'package:trying_app/models/GratitudeCard.dart';
import 'package:trying_app/models/MedicalCard.dart';

class MainPage extends StatefulWidget { @override MainPageState createState() => MainPageState(); }

class MainPageState extends State<MainPage> {
  // instance variable
  Entry _todaysEntry; // have MainPage hold current relevant Entry for loading/updating widgets
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    super.initState();

    // initialize temporary example Entry
    _todaysEntry = new Entry(DateTime.now());
  }


  // Build Page
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              // home message
              Text("Hello Zeu! Glad you're checking in!"),

              // card view
              _buildCardCarousel()


            ],
          ),
        ),
      ),
    );
  }

  // methods
  // build cards based on current Entry
  Widget _buildCardCarousel() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        PageView(
          children: [
            MedicalCard(
              todaysEntry: _todaysEntry,
              onYesPressed: () => {},
              onNoPressed: () => {},
              key: UniqueKey(),
            ),

            GratitudeCard(
              todaysEntry: _todaysEntry,
              onYesPressed: () => {},
              key: UniqueKey(),
            )
          ],
        )
      ],
    );
  }




}