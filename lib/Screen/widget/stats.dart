import 'package:flutter/material.dart';
class stats extends StatelessWidget {
  const stats({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 00.0),
      child: Column(
        children: <Widget>[
Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: <Widget>[
    Container(
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15.0),
      width: MediaQuery.of(context).size.width / 1 - 20,
      height: 100.0,
      decoration: BoxDecoration(
        color: Color(0XFFFFB259),
        borderRadius: BorderRadius.circular(7.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.asset(
          'lib/image/wat.jpg', // Replace with the actual image path
          width: 50.0,
          height: 50.0,
        ),
          SizedBox(width: 10.0),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Affected",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    "336,851",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  ],
),
          SizedBox(height: 10.0),
                    Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      child: Center(
        child: Stack(
          children: [
            Image.asset(
              'lib/image/wat.jpg',
              width: MediaQuery.of(context).size.width / 0,
              height: MediaQuery.of(context).size.height / 2,
            ),
            Positioned(
              bottom: 72,
              child: Column(
                children: [
                  Container(
                    padding:
                      const EdgeInsets.only(
                        top: 28,
                        left: 15,
                        right: 15
                       ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromRGBO(249, 249, 249, 0.7),
                    ),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 9,
                    margin: const EdgeInsets.only(left: 18),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                        mainAxisAlignment:MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              'Orange Juice',
                              style: TextStyle(
                                fontSize: 17,
                                color: Color.fromARGB(255, 58, 54, 54),
                              ),
                            ),
                            Text(
                              '35 Cal',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontFamily: 'YekanRegular',
                                color: Color.fromARGB(255, 58, 54, 54),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),

          SizedBox(height: 10.0),
Center(
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(color: Colors.black, width: 1),
                ),
              ),
              child: Image.asset('lib/image/wat.jpg',
              fit:BoxFit.fitHeight,
              width: 50,
              height: 50,),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Name'),
                        Text('Price'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Date'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Quantity: 3'),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('Total Amount'),
                        Text('Rs. 253'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
          SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width / 3 - 25,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Color(0XFF4CD97B),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Recovered",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Text(
                      "17,977",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width / 3 - 25,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Color(0XFF4DB5FF),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Active",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Text(
                      "301,251",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 15.0),
                width: MediaQuery.of(context).size.width / 3 - 25,
                height: 100.0,
                decoration: BoxDecoration(
                    color: Color(0XFF9059FF),
                    borderRadius: BorderRadius.circular(7.0)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Serious",
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                    ),
                    Text(
                      "8,702",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  }

