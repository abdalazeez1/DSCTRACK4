import 'dart:async';

import 'package:flutter/material.dart';

class TAsk2 extends StatefulWidget {
  @override
  _TAsk2State createState() => _TAsk2State();
}

class _TAsk2State extends State<TAsk2> {
  bool isMail = false;
  double valForHeight = 100;
  double valueForWight = 30;
  double resut;
  bool showResult = false;
  bool changeAlign = false;
  bool hideContent = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: showResult ? buildResuiltCard(size) : buildBmiCal(size),
      ),
    );
  }

  GestureDetector buildResuiltCard(Size size) {
    return GestureDetector(
      onTap: returnToHomeScreen,
      child: Container(
        color: Colors.grey.shade200,
        height: size.height,
        width: size.width,
        child: AnimatedAlign(
          duration: Duration(milliseconds: 600),
          alignment: changeAlign ? Alignment.center : Alignment.bottomCenter,
          child: AnimatedContainer(
            duration: Duration(milliseconds: 600),
            padding: EdgeInsets.only(top: 30),
            height: changeAlign ? size.height * 0.3 : 20,
            width: changeAlign ? size.width * 0.5 : 20,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.indigo.shade500),
            child: hideContent
                ? Column(
                    children: [
                      Text(
                        'so ${resut > 25 ? 'wight' : 'thin'} ',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '${resut.toInt()}',
                        style: TextStyle(
                            color: Colors.white70,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  void returnToHomeScreen() {
    setState(() {
      changeAlign = false;
      hideContent = false;
    });
    Timer(Duration(milliseconds: 800), () {
      setState(() {
        showResult = false;
        hideContent = true;
      });
    });
  }

  Container buildBmiCal(Size size) {
    return Container(
      padding: EdgeInsets.only(top: 10, left: 4, right: 4),
      child: Column(
        children: [
          buildRadioListTile(text: 'male', valOfRad: true),
          buildRadioListTile(text: 'female', valOfRad: false),
          buildDivider(),
          buildChoseHAndW(title: 'height', isHeight: true),
          buildDivider(),
          buildChoseHAndW(title: 'weight', isHeight: false),
          SizedBox(
            height: size.height * 0.1,
          ),
          Container(
              width: size.width * 2 / 3,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.indigo.shade400)),
                  onPressed: cal,
                  child: Text('calculate')))
        ],
      ),
    );
  }

  Widget buildDivider() {
    return Padding(
      padding: const EdgeInsets.only(left: 50, right: 50, top: 40),
      child: Divider(
        color: Colors.grey.shade300,
        thickness: 1,
      ),
    );
  }

  Column buildChoseHAndW({
    @required String title,
    @required bool isHeight,
  }) {
    return Column(
      children: [
        Text(
          'please chose $title ',
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Slider(
            activeColor: Colors.indigo.shade300,
            min: isHeight ? 50 : 20,
            max: isHeight ? 200 : 150,
            value: isHeight ? valForHeight : valueForWight,
            onChanged: (val) {
              setState(() {
                isHeight ? valForHeight = val : valueForWight = val;
              });
            }),
        Text(
          '${(isHeight ? valForHeight : valueForWight).toInt()}',
          style: TextStyle(
            color: Colors.grey.shade500,
            fontSize: 14,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }

  RadioListTile<bool> buildRadioListTile({
    @required String text,
    @required bool valOfRad,
  }) =>
      RadioListTile(
        contentPadding: EdgeInsets.only(right: 40, left: 10),
        activeColor: Colors.deepPurple,
        secondary: !valOfRad ? Icon(Icons.pregnant_woman) : Icon(Icons.hail),
        title: Text(text),
        value: valOfRad,
        groupValue: isMail,
        onChanged: (val) {
          setState(
            () {
              isMail = val;
            },
          );
        },
      );

  void cal() {
    resut = valueForWight / (valForHeight / 100);
    setState(() {
      showResult = !showResult;
      hideContent = false;
    });
    Timer(Duration(milliseconds: 600), () {
      setState((){
        changeAlign = true;
        Timer
          (Duration(milliseconds: 300), () {
          setState(() {
            hideContent = true;
          });
        });
      });
    });
  }
}
