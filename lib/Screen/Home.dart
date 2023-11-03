import 'package:flutter/material.dart';
import 'package:pagoda/Screen/homescreen.dart';
import 'package:pagoda/Screen/widget/revenur/list_revenue.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _currentIndex = 0; // To track the index of the selected screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: _buildScreen(), // Call a method to build the screen based on the selected index
      bottomNavigationBar: _buildBottomNavigationBar(), // Call a method to build the bottom navigation bar
    );
  }

  Widget _buildScreen() {
    // Implement the logic to return the appropriate screen based on the selected index
    // For example:
    switch (_currentIndex) {
      case 0:
        return HomeScreen();
      case 1:
        return list_revenue();
      //  case 2:
      //    return category();
      default:
        return Container();
    }
  }

  Widget _buildBottomNavigationBar() {
    // Build the bottom navigation bar using BottomNavigationBar widget
    return BottomNavigationBar(
      currentIndex: _currentIndex, // Set the currentIndex to track the selected screen
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update the currentIndex when a different screen is tapped
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ទំព័រដើម',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'ចំណូល',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}