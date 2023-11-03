import 'package:pagoda/Screen/stats_screen.dart';
import 'package:flutter/material.dart';
import 'package:pagoda/Screen/widget/appbar_homepage.dart';
import 'package:pagoda/Screen/widget/bottom_bar.dart';
import 'package:pagoda/Screen/widget/list_10txn.dart';
import 'package:pagoda/Screen/widget/stats.dart';
import 'package:pagoda/Screen/widget/stats_filter.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0), // Set the preferred height here
        child: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.notifications_none),
              onPressed: () {},
            )
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[appbar_homepage(),

        SizedBox(width: 20,),

        StatsFilter(),
        Trx()],
      ),
      // bottomNavigationBar: bottom_navbar(),
    );
  }
}