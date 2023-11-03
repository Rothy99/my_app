import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class Txn_summary {
  bool? success;
  int? status;
  Null? error;
  Data? data;

  Txn_summary({this.success, this.status, this.error, this.data});

  Txn_summary.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    status = json['status'];
    error = json['error'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status'] = this.status;
    data['error'] = this.error;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  List<Weekly>? weekly;
  List<Monthly>? monthly;
  List<LastMonth>? lastMonth;

  Data({this.weekly, this.monthly, this.lastMonth});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['weekly'] != null) {
      weekly = <Weekly>[];
      json['weekly'].forEach((v) {
        weekly!.add(new Weekly.fromJson(v));
      });
    }
    if (json['monthly'] != null) {
      monthly = <Monthly>[];
      json['monthly'].forEach((v) {
        monthly!.add(new Monthly.fromJson(v));
      });
    }
    if (json['last_month'] != null) {
      lastMonth = <LastMonth>[];
      json['last_month'].forEach((v) {
        lastMonth!.add(new LastMonth.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.weekly != null) {
      data['weekly'] = this.weekly!.map((v) => v.toJson()).toList();
    }
    if (this.monthly != null) {
      data['monthly'] = this.monthly!.map((v) => v.toJson()).toList();
    }
    if (this.lastMonth != null) {
      data['last_month'] = this.lastMonth!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Weekly {
  String? totalRevenueRielWeek;
  String? totalRevenueDollarWeek;
  String? totalExpendRielWeek;
  String? totalExpendDollarWeek;
  String? colorWeek;

  Weekly(
      {this.totalRevenueRielWeek,
      this.totalRevenueDollarWeek,
      this.totalExpendRielWeek,
      this.totalExpendDollarWeek,
      this.colorWeek});

  Weekly.fromJson(Map<String, dynamic> json) {
    totalRevenueRielWeek = json['TotalRevenueRielWeek'];
    totalRevenueDollarWeek = json['TotalRevenueDollarWeek'];
    totalExpendRielWeek = json['TotalExpendRielWeek'];
    totalExpendDollarWeek = json['TotalExpendDollarWeek'];
    colorWeek = json['ColorWeek'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalRevenueRielWeek'] = this.totalRevenueRielWeek;
    data['TotalRevenueDollarWeek'] = this.totalRevenueDollarWeek;
    data['TotalExpendRielWeek'] = this.totalExpendRielWeek;
    data['TotalExpendDollarWeek'] = this.totalExpendDollarWeek;
    data['ColorWeek'] = this.colorWeek;
    return data;
  }
}

class Monthly {
  String? totalRevenueRielMonth;
  String? totalRevenueDollarMonth;
  String? totalExpendRielMonth;
  String? totalExpendDollarMonth;
  String? colorMonth;

  Monthly(
      {this.totalRevenueRielMonth,
      this.totalRevenueDollarMonth,
      this.totalExpendRielMonth,
      this.totalExpendDollarMonth,
      this.colorMonth});

  Monthly.fromJson(Map<String, dynamic> json) {
    totalRevenueRielMonth = json['TotalRevenueRielMonth'];
    totalRevenueDollarMonth = json['TotalRevenueDollarMonth'];
    totalExpendRielMonth = json['TotalExpendRielMonth'];
    totalExpendDollarMonth = json['TotalExpendDollarMonth'];
    colorMonth = json['ColorMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalRevenueRielMonth'] = this.totalRevenueRielMonth;
    data['TotalRevenueDollarMonth'] = this.totalRevenueDollarMonth;
    data['TotalExpendRielMonth'] = this.totalExpendRielMonth;
    data['TotalExpendDollarMonth'] = this.totalExpendDollarMonth;
    data['ColorMonth'] = this.colorMonth;
    return data;
  }
}

class LastMonth {
  String? totalRevenueRielLastMonth;
  String? totalRevenueDollarLastMonth;
  String? totalExpendRielLastMonth;
  String? totalExpendDollarLastMonth;
  String? colorLastMonth;

  LastMonth(
      {this.totalRevenueRielLastMonth,
      this.totalRevenueDollarLastMonth,
      this.totalExpendRielLastMonth,
      this.totalExpendDollarLastMonth,
      this.colorLastMonth});

  LastMonth.fromJson(Map<String, dynamic> json) {
    totalRevenueRielLastMonth = json['TotalRevenueRielLastMonth'];
    totalRevenueDollarLastMonth = json['TotalRevenueDollarLastMonth'];
    totalExpendRielLastMonth = json['TotalExpendRielLastMonth'];
    totalExpendDollarLastMonth = json['TotalExpendDollarLastMonth'];
    colorLastMonth = json['ColorLastMonth'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['TotalRevenueRielLastMonth'] = this.totalRevenueRielLastMonth;
    data['TotalRevenueDollarLastMonth'] = this.totalRevenueDollarLastMonth;
    data['TotalExpendRielLastMonth'] = this.totalExpendRielLastMonth;
    data['TotalExpendDollarLastMonth'] = this.totalExpendDollarLastMonth;
    data['ColorLastMonth'] = this.colorLastMonth;
    return data;
  }
}

class StatsFilter extends StatefulWidget {
  const StatsFilter({Key? key});

  @override
  _StatsFilterState createState() => _StatsFilterState();
}

class _StatsFilterState extends State<StatsFilter> {
 
  late Future<Txn_summary> _fetchDataFuture;

  @override
  void initState() {
    super.initState();
    _fetchDataFuture = _fetchData();
  }

  Future<Txn_summary> _fetchData() async {
    final response = await http.get(Uri.parse('https://kdpgd.com/index.php/API/list_txn/Get_total_summary'));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      return Txn_summary.fromJson(jsonData);
    } else {
      throw Exception('Failed to fetch data');
    }
  }

  @override
Widget build(BuildContext context) {
  return Container(
    // Add your UI code here
    child: FutureBuilder<Txn_summary>(
      future: _fetchDataFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(); // Show a progress indicator while fetching data
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error} ❌'); // Display an error message with a cross mark emoji
        } else if (snapshot.hasData) {
          // Use the fetched data to display the stats
          final data = snapshot.data!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(left:5.0),
                child: Text(
                  'ស្ថិតិប្រចាំសប្តាហ៍ប្រចាំខែ និងខែមុន', // Replace 'Statistics' with your desired title
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'moul'
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildStatsBox(
                      'ប្រចាំសប្តាហ៍',
                      data.data?.weekly?.first.totalRevenueRielWeek ?? 'N/A',
                      data.data?.weekly?.first.totalRevenueDollarWeek ?? 'N/A',
                      data.data?.weekly?.first.totalExpendRielWeek ?? 'N/A',
                      data.data?.weekly?.first.totalExpendDollarWeek ?? 'N/A',
                      data.data?.weekly?.first.colorWeek ?? 'N/A',
                    ),
                    _buildStatsBox(
                      'ប្រចាំខែ',
                      data.data?.monthly?.first.totalRevenueRielMonth ?? 'N/A',
                      data.data?.monthly?.first.totalRevenueDollarMonth ?? 'N/A',
                      data.data?.monthly?.first.totalExpendRielMonth ?? 'N/A',
                      data.data?.monthly?.first.totalExpendDollarMonth ?? 'N/A',
                      data.data?.monthly?.first.colorMonth ?? 'N/A',
                    ),
                    _buildStatsBox(
                      'ខែមុន',
                      data.data?.lastMonth?.first.totalRevenueRielLastMonth ?? 'N/A',
                      data.data?.lastMonth?.first.totalRevenueDollarLastMonth ?? 'N/A',
                      data.data?.lastMonth?.first.totalExpendRielLastMonth ?? 'N/A',
                      data.data?.lastMonth?.first.totalExpendDollarLastMonth ?? 'N/A',
                      data.data?.lastMonth?.first.colorLastMonth ?? 'N/A',
                    ),
                  ],
                ),
              ),
            ],
          );
        } else {
          return Text('No data available 📭'); // Display a message indicating no data available with an open mailbox emoji
        }
      },
    ),
  );
}

Widget _buildStatsBox(
    String title, String revenueRiel, String revenueDollar, String expendRiel, String expendDollar, String color) {
  return Container(
    // Padding around the title text
             
    padding: const EdgeInsets.symmetric(horizontal: 3.0, vertical: 3.0),
    decoration: BoxDecoration(
      color: Colors.grey[300],
      borderRadius: BorderRadius.circular(0),
    ),
    child: Column(
      children: <Widget>[
        
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              width: MediaQuery.of(context).size.width / 1 - 70,
              height: 170.0,
              decoration: BoxDecoration(
                color: Color(int.parse(color)),
                borderRadius: BorderRadius.circular(7.0),
              ),
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    
                    title,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'moul',
                    ),
                  ),
                    Text(
                    'ចំណូល',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'moul',
                    ),
                  ),
                  SizedBox(height: 1,),
                  
                  Row(
                    
                    children: [
                      Text(
                         revenueRiel,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14.0,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'moul',
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                     revenueDollar,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'moul',
                    ),
                  ),
                    ],
                  ),
                  Text(
                    'ចំណាយ',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'moul',
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                         expendRiel,
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                          fontFamily: 'moul',
                        ),
                      ),
                      SizedBox(width: 10,),
                      Text(
                    expendDollar,
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      fontFamily: 'moul',
                  ),
                  )
                    ],
                  ),
                  
                ],
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
}