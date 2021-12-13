import 'package:flutter/material.dart';
import 'components/contentCard.dart';
import 'constants.dart';

class InputScreen extends StatefulWidget {
  //InputScreen({Key? key}) : super(key: key);

  @override
  _InputScreenState createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  genderCluster? gend;
  Color cardColor = Color(0xff272A4D);
  int height = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0A0C21),
      appBar: AppBar(
        title: Center(
          child: Text(
            'BMI CALCULATOR',
          ),
        ),
        backgroundColor: Color(0xff090E21),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Row(children: [
              CardContent(
                clicker: () {
                  setState(() {
                    gend = genderCluster.MALE;
                  });
                },
                gender: 'MALE',
                iconname: Icons.male,
                cardColor:
                    gend == genderCluster.MALE ? cardColor : Color(0xff14183B),
              ),
              SizedBox(
                width: 10,
              ),
              CardContent(
                clicker: () {
                  setState(() {
                    gend = genderCluster.FEMALE;
                  });
                },
                gender: 'FEMALE',
                iconname: Icons.female,
                cardColor: gend == genderCluster.FEMALE
                    ? cardColor
                    : Color(0xff14183B),
              ),
            ]),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: cardColor,
              ),
              padding: EdgeInsets.all(8),
              margin: EdgeInsets.all(8),
              height: 200,
              width: 400,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: txt,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.ideographic,
                    children: [
                      Text(
                        "$height",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      Positioned(
                        top: 10,
                        bottom: 20,
                        child: Text(
                          "cm",
                          style: txt
                        ),
                      ),
                    ],
                  ),
                  Slider(
                      value: height.toDouble(),
                      min: 0,
                      max: 250,
                      divisions: 250,
                      activeColor: Colors.white,
                      inactiveColor: Colors.grey,
                      thumbColor: Colors.pinkAccent,
                      onChanged: (double newValue){
                        setState(() {
                          height = newValue.round();
                        });
                      }
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
