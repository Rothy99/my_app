import 'package:flutter/material.dart';
import 'package:pagoda/Screen/stats_screen.dart';
import 'package:pagoda/Screen/widget/revenur/list_revenue.dart';
class bottom_navbar extends StatelessWidget {
  const bottom_navbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      height: 50.0,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40.0,
            width: 70.0,
            decoration: BoxDecoration(
                color: Color(0XFF4C79FF),
                borderRadius: BorderRadius.circular(20.0)),
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          GestureDetector(
            child: Container(
              height: 40.0,
              width: 70.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: Icon(
                Icons.insert_chart,
                color: Color(0XFF999FbF),
              ),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => StatsScreen()));
            },
          ),
          Container(
            height: 40.0,
            width: 70.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(
              Icons.library_books,
              color: Color(0XFF999FbF),
            ),
          ),
          Container(
            height: 40.0,
            width: 70.0,
            decoration:
                BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
            child: Icon(
              Icons.report,
              color: Color(0XFF999FbF),
            ),
          ),
        ],
      ),
    );
  }
}