import 'package:flutter/material.dart';
import 'package:pagoda/Screen/widget/bottom_bar.dart';

class list_revenue extends StatefulWidget {
  @override
  _list_revenueState createState() => _list_revenueState();
}

class _list_revenueState extends State<list_revenue> {
  List<String> items = List.generate(20, (index) => 'Item ${index + 1}');
  List<String> filteredItems = List.generate(20, (index) => 'Item ${index + 1}');

  void filterItems(String query) {
    setState(() {
      filteredItems = items
          .where((item) =>
              item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
       appBar: AppBar(
        title: const Text(
              'ចំណូល',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'moul',
              ),
              ),
        titleSpacing: 00.0,
        centerTitle: true,
        toolbarHeight: 100.0,
        toolbarOpacity: 0.8,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        elevation: 0.00,
        backgroundColor: Colors.grey[400],
      
       
        leading: IconButton(
          icon: const Icon(
            Icons.home,
            color: Colors.black,
          ),
          onPressed: () {},
        ),
      ), //AppBar
     
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) => filterItems(value),
              decoration: InputDecoration(
                labelText: 'Search',
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItems.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItems[index]),
                );
              },
            ),
            
          ),
          
        ],
      ),
     
    );
  }
}