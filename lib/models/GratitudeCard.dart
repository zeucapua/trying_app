import 'package:flutter/material.dart';
import 'package:trying_app/models/Entry.dart';

class GratitudeCard extends StatefulWidget {
  // instance variable
  GratitudeCardState state;

  // constructor
  GratitudeCard({Entry todaysEntry, GestureTapCallback onYesPressed, Key key})
    : super(key: key) { state = GratitudeCardState(todaysEntry, onYesPressed); }

  // build state
  @override GratitudeCardState createState() => state;
}

class GratitudeCardState extends State<GratitudeCard> {
  // instance variables
  bool isGratitudeLogged;
  Entry todaysEntry;
  final textController = TextEditingController();
  final GestureTapCallback onYesPressed;

  // constructor
  GratitudeCardState(this.todaysEntry, this.onYesPressed) {
    isGratitudeLogged =  todaysEntry.gratitude != null; //|| todaysEntry.gratitude.isEmpty;
  }

  @override
  Widget build(BuildContext context) {
    return !isGratitudeLogged ?
    SizedBox(
      width: 300.0, height: 500.0,
      child: Card(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [

              // message
              Text("Can you think of one thing/person you're grateful for today?", style: TextStyle(fontSize: 40.0, color: Colors.white),),

              // text line for user input
              TextField(
                controller: textController,
                decoration: InputDecoration(labelText: "If not, I'm glad you're still here."),
              ),


              // button
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  FloatingActionButton(
                    onPressed: onYesPressed,
                    child: Icon(Icons.check, color: Colors.green,),
                    backgroundColor: Colors.white,
                  )
                ],
              )



            ],
          ),
        ),
      ),

    )
    : SizedBox(
      width: 300.0, height: 500.0,
      child: Card(

      ),


    );
  }
}