import 'package:flutter/material.dart';


class HistoryPage extends StatelessWidget {
  const HistoryPage ({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                height: 250,
                padding: EdgeInsets.only(top:25, left: 20, right: 30),
                child:
                FittedBox(
                  child: Image.asset("images/nurse5.png"),
                  fit: BoxFit.fill,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child:
                Text("HISTORY", style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 209, 227, 231)
                ),),
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                  height: 125,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 209, 227, 231),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text('Permintaan Infus pada kamar VVIP 1', style:  TextStyle( fontSize: 20, color: Colors.lightBlueAccent),)
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 125,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 209, 227, 231),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text('Permintaan Infus pada kamar VVIP 1', style:  TextStyle( fontSize: 20, color: Colors.lightBlueAccent),)

                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 125,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color.fromARGB(255, 209, 227, 231),
                  ),
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  child: Text('Permintaan Infus pada kamar VVIP 1', style:  TextStyle( fontSize: 20, color: Colors.lightBlueAccent),)

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 125,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 209, 227, 231),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text('Permintaan Infus pada kamar VVIP 1', style:  TextStyle( fontSize: 20, color: Colors.lightBlueAccent),)

                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    height: 125,
                    width: 400,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color.fromARGB(255, 209, 227, 231),
                    ),
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: Text('Permintaan Infus pada kamar VVIP 1', style:  TextStyle( fontSize: 20, color: Colors.lightBlueAccent),)

                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}