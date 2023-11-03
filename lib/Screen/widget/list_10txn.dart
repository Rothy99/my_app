import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert'; // For JSON parsing

class Trx extends StatefulWidget {
  const Trx({Key? key});

  @override
  _TrxState createState() => _TrxState();
}

class _TrxState extends State<Trx> {
  List<Trx_list> transactions = []; // List to store the fetched transactions

  @override
  void initState() {
    super.initState();
    fetchTransactions(); // Call the method to fetch transactions when the widget is initialized
  }

  Future<void> fetchTransactions() async {
    final url = Uri.parse('https://kdpgd.com/index.php/API/list_txn/Get_10_txn');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Trx_list> fetchedTransactions = List.from(jsonData)
          .map((data) => Trx_list.fromJson(data))
          .toList();

      setState(() {
        transactions = fetchedTransactions;
      });
    } else {
      print('Failed to fetch transactions. Error: ${response.statusCode}');
    }
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;

    // Calculating the desired height proportional to the screen size
    final double desiredHeight = screenHeight * 0.5; // You can adjust the factor as per your requirement

    return Container(
      height: desiredHeight,
      color: Colors.grey[300], // Background color
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(
            padding: const EdgeInsets.only(left:5.0),
             // Padding around the title text
            child: Text(
              'កំណត់ត្រា 10 ចុងក្រោយ',
              style: TextStyle(
                color: Colors.black54,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: 'moul'
                
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // SizedBox(height: 8.0),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(), // Disable scrolling of inner ListView
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final transaction = transactions[index];
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 0.0),
                        child: Center(
                          child: Card(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 10),
                                  child: Image.network(
                                    transaction.icon!,
                                    fit: BoxFit.fitHeight,
                                    width: 35,
                                    height: 35,
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    padding: EdgeInsets.symmetric(horizontal: 1, vertical: 1),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.stretch,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Expanded(
                                              child: Text(
                                                transaction.txn!,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 2.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(transaction.date!),
                                          ],
                                        ),
                                        SizedBox(height: 2.0),
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text('Amount'),
                                            Text(
                                              transaction.amount!,
                                              style: TextStyle(
                                                fontSize: 20, // Increase the font size to 20
                                                fontWeight: FontWeight.bold,
                                                color: Color(int.parse(transaction.color!)),
                                              ),
                                            ),
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
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          
        ],
      ),
    );
  }
}

class Trx_list {
  String? txn;
  String? date;
  String? amount;
  String? icon;
  String? color;

  Trx_list({this.txn, this.date, this.amount, this.icon, this.color});

  Trx_list.fromJson(Map<String, dynamic> json) {
    txn = json['txn'];
    date = json['date'];
    amount = json['amount'];
    icon = json['icon'];
    color = json['color'];
  }
}