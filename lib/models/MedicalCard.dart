import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:trying_app/models/Entry.dart';

class MedicalCard extends StatefulWidget {
  // instance variable
  MedicalCardState state;

  // constructor
  MedicalCard({Entry todaysEntry, GestureTapCallback onYesPressed, GestureTapCallback onNoPressed, Key key})
      : super(key: key) { state = MedicalCardState(todaysEntry, onYesPressed, onNoPressed); }

  // build state
  @override MedicalCardState createState() => state;
}

class MedicalCardState extends State<MedicalCard> {

  // instance variables
  bool isMedicationLogged;
  Entry todaysEntry;
  final GestureTapCallback onYesPressed;
  final GestureTapCallback onNoPressed;

  // constructor
  MedicalCardState(this.todaysEntry, this.onYesPressed, this.onNoPressed) {
    isMedicationLogged = todaysEntry.isMedicationTaken != null;
  }

  // build
  @override
  Widget build(BuildContext context) {
    return !isMedicationLogged ?
    SizedBox(
      width: 300.0, height: 500.0,
      child: Card( // if needing to log whether medication has been taken
        color: Color(Colors.redAccent.value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // message
              Text("Have you taken your medication today?", style: TextStyle(fontSize: 40.0, color: Colors.white),),


              // buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: onYesPressed,
                    child: Icon(Icons.check, color: Colors.white,),
                    backgroundColor: Colors.green,
                  ),
                  FloatingActionButton(
                    onPressed: onNoPressed,
                    child: Icon(Icons.cancel_outlined, color: Colors.white),
                    backgroundColor: Colors.red,
                  )
                ],
              )


            ],
          ),
        ),
      ),
    ) :
    SizedBox(
      width: 300.0, height: 500.0,
      child: Card( // if medication has been taken, give option to redo
        color: Color(Colors.redAccent.value),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // message: whether medication has been taken or not based on Entry
              todaysEntry.isMedicationTaken ?
              Text("You've taken your medication today", style: TextStyle(fontSize: 40.0, color: Colors.white)) :
              Text("You haven't taken your medication today", style: TextStyle(fontSize: 40.0, color: Colors.white)),

              // message: give option to redo entry
              Text("Would you like to redo your entry?"),

              // button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: () => { isMedicationLogged = false },
                    child: Icon(Icons.redo, color: Colors.red,),
                    backgroundColor: Colors.white,
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );

  }
}