import 'dart:math';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:imtihon/screens/api_page.dart';

class MainPage extends StatefulWidget {
  Color? color;
  String? username;
  int? soni;
  MainPage({this.color, this.username, this.soni});
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;
  int togri = 0;
  String computer = "";
  String player = "";
  int computerScore = 0;
  int playerScore = 0;
  int tapTimes = 0;
  String winner = "";
  Color chosenTosh = Colors.blue;
  Color chosenQaychi = Colors.blue;
  Color chosenQogoz = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                alignment: Alignment.center,
                height: MediaQuery.of(context).size.height * .1,
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "${widget.username?.toUpperCase()}, O'yin boshlandi bratshka",
                  style: TextStyle(
                      color: widget.color,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .15,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              chosenTosh = Colors.purple;
                              chosenQaychi = widget.color!;
                              chosenQogoz =widget.color!;
                              player = "✊";
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "✊",
                              style: TextStyle(fontSize: 40.0),
                            ),
                            decoration: BoxDecoration(
                              color: chosenTosh,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                               chosenQaychi = Colors.purple;
                              chosenQogoz = widget.color!;
                              chosenTosh = widget.color!;
                              player = "✌️";
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "✌️",
                              style: TextStyle(fontSize: 40.0),
                            ),
                            decoration: BoxDecoration(
                              color: chosenQaychi,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              chosenQogoz = Colors.purple;
                              chosenTosh = widget.color!;
                              chosenQaychi = widget.color!;
                              player = "👋";
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              "👋",
                              style: TextStyle(fontSize: 40.0),
                            ),
                            decoration: BoxDecoration(
                               color: chosenQogoz,
                              borderRadius: BorderRadius.circular(
                                10.0,
                              ),
                            ),
                            width: MediaQuery.of(context).size.width * 0.2,
                            height: MediaQuery.of(context).size.height * 0.1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .15,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          "Computer",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                        Container(
                          alignment: Alignment.center,
                          child: Text(
                            computer,
                            style: TextStyle(fontSize: 40.0),
                          ),
                          decoration: BoxDecoration(
                            color: widget.color,
                            borderRadius: BorderRadius.circular(
                              10.0,
                            ),
                          ),
                          width: MediaQuery.of(context).size.width * 0.2,
                          height: MediaQuery.of(context).size.height * 0.1,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.0),
              InkWell(
                onTap: () {
                  setState(() {
                    tapTimes += 1;
                    int randomNumber = Random().nextInt(2);
                    if (tapTimes == widget.soni) {
                      if (computerScore > playerScore) {
                        winner = "Computer win";
                      }else if(computerScore == playerScore) {
                        winner = "Durang";
                      } else{
                        winner = "You Win";
                      }
                      AwesomeDialog(
                        context: context,
                        dialogType: DialogType.SUCCES,
                        animType: AnimType.BOTTOMSLIDE,
                        title: "Game is Over",
                        desc: winner,
                        btnOkOnPress: () {
                          tapTimes = 0;
                          computerScore = 0;
                          playerScore = 0;
                          computer = "";
                        },
                      )..show();
                    }
                    if (randomNumber == 1) {
                      computer = "✌️";
                    } else if (randomNumber == 2) {
                      computer = "✊";
                    } else if (randomNumber == 0) {
                      computer = "👋";
                    }

                    if ((computer == "✊" && player == "✌️") ||
                        (computer == "👋" && player == "✊") ||
                        (computer == "✌️" && player == "👋")) {
                      computerScore += 1;
                    } else if ((computer == "✊" && player == "👋") ||
                        (computer == "✌️" && player == "✊") ||
                        (computer == "👋" && player == "✌️")) {
                      playerScore += 1;
                    } 
                  });
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    "Play",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * .2,
                width: MediaQuery.of(context).size.width * .9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(.2),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Scores",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 23.0),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "${widget.username}",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "$playerScore",
                                  style: TextStyle(fontSize: 40.0),
                                ),
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .15,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "Computer",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0),
                              ),
                              Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "$computerScore",
                                  style: TextStyle(fontSize: 40.0),
                                ),
                                decoration: BoxDecoration(
                                  color: widget.color,
                                  borderRadius: BorderRadius.circular(
                                    10.0,
                                  ),
                                ),
                                width: MediaQuery.of(context).size.width * 0.2,
                                height:
                                    MediaQuery.of(context).size.height * 0.1,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ApiPage(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  height: MediaQuery.of(context).size.height * .1,
                  width: MediaQuery.of(context).size.width * .7,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.circular(
                      15.0,
                    ),
                  ),
                  child: Text(
                    "Score Board",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
