// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class AboutScreen extends StatelessWidget {
  bool lighttheme = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Positioned(
            child: Center(
              child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xFF374f64),
                          spreadRadius: 0,
                          blurRadius: 10),
                    ],
                  ),
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width - 100,
                  child: Card(
                    color: HexColor("1C2833"),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 120,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Text(
                            "One of the first few apps I made while on my journey to learn flutter.",
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "You can find the whole source code on",
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "github.com/Punithraaj",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Text(
                          "Made with ❤ by",
                          style: TextStyle(
                            fontSize: 12,
                            fontStyle: FontStyle.normal,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "@Punithraaj",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25.0,
                            vertical: 8.0,
                          ),
                          child: Text(
                            "A self-taught programmer who always passionate to learn something new and interesting",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  )),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 150.0),
              child: Container(
                height: 130,
                width: 130,
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                    "assets/images/profile.JPG",
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
