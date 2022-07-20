import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class notificationPage extends StatefulWidget {
    const notificationPage({Key? key}) : super(key: key);

  @override
  State<notificationPage> createState() => _notificationPageState();
}

class _notificationPageState extends State<notificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color.fromARGB(255, 209, 227, 231),
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Center(
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_outlined,
                color: Color.fromARGB(255, 0, 0, 0),
                size: 25,
              ),
            ),
          ),
        ),
        title: const Text('Home'),
      ),
      backgroundColor:  Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Container(
          child: GestureDetector(
            onTap: (){
              Alert(
                context: context,
                title: 'PERMINTAAN ANDA SEDANG DI PROSES',
                desc: 'MOHON TUNGGU PERAWAT DATANG',
                type: AlertType.success,
                style: AlertStyle(
                  animationType:  AnimationType.fromBottom,
                  animationDuration: Duration(milliseconds: 500),
                  backgroundColor: Colors.blue,
                  titleStyle: TextStyle(
                    color: Colors.white,
                  )
                )
              ).show();
            },
            child: Center(
                child:
                Text('AJUKAN PERMINTAAN', style: TextStyle(fontSize: 19, color:  Colors.black),)),
          ) ,
        ),
      ),
    );
  }
}
