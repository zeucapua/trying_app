import 'package:flutter/material.dart';

class MedicalCard extends StatefulWidget {
  // instance variable
  MedicalCardState state;

  // constructor
  MedicalCard(GestureTapCallback onYesPressed, GestureTapCallback onNoPressed) {
    state = MedicalCardState(onYesPressed, onNoPressed);
  }

  // build state
  @override MedicalCardState createState() => state;
}

class MedicalCardState extends State<MedicalCard> {

  // instance variables
  final GestureTapCallback onYesPressed;
  final GestureTapCallback onNoPressed;

  // constructor
  MedicalCardState(this.onYesPressed, this.onNoPressed);

  // build
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Color(Colors.redAccent.value),
      child: Container(
        child: Column(
          children: [

            // message
            Text("Have you taken your medication today?", style: TextStyle(fontSize: 50.0, color: Colors.white),),


            // buttons
            Row(
              children: [
                FloatingActionButton(onPressed: onYesPressed, child: Icon(Icons.check),),
                FloatingActionButton(onPressed: onNoPressed, child: Icon(Icons.cancel_outlined),)
              ],
            )


          ],
        ),
      ),
    );

  }
}