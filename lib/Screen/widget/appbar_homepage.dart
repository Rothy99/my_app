import 'package:flutter/material.dart';
class appbar_homepage extends StatelessWidget {
  const appbar_homepage({super.key});

  @override
  Widget build(BuildContext context) {
  return Container(
    
    height: 150.0,
    padding: EdgeInsets.symmetric(horizontal: 20.0),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage('lib/image/wat.jpg'),
        fit: BoxFit.cover,
      ),
      borderRadius: BorderRadius.circular(0.0),
    ),
    child: LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Padding(
          padding: const EdgeInsets.only(bottom:8.0),
          child: Align(
             alignment: Alignment.bottomRight,
            child: Container(
              padding: const EdgeInsets.only(
                top: 3,  // Adjust the top padding as desired
                left: 15,
                right: 25,
                bottom: 3,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color.fromARGB(209, 255, 255, 255),
              ),
              width: constraints.maxWidth * 0.6,
              height: constraints.maxHeight * 0.3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text(
                        'វត្ដកោះអណ្ដែត',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color.fromARGB(255, 58, 54, 54),
                          fontFamily: 'moul',
                          
                        ),
                        textAlign: TextAlign.center,
                      ),
                      
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ),
  );
}
}