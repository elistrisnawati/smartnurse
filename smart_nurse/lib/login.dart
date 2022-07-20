import 'package:flutter/material.dart';


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Center(
      child: Column(
        children: [
          Container(
            height: 300,
            padding: EdgeInsets.only(top:25, left: 20, right: 30),
            child:
            FittedBox(
                child: Image.asset("images/nurse1.png"),
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child:
            Text("LOGIN", style: TextStyle(
              fontSize: 30,
              color: Color.fromARGB(255, 209, 227, 231)
            ),),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 209, 227, 231),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            width: 400,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 209, 227, 231),
            ),
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            height: 50,
              width: 200,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 209, 227, 231),
                borderRadius: BorderRadius.circular(20),
              ),
              padding: EdgeInsets.only(left: 20, right: 30),
              child:
             Center(
               child: Text("Login", style: TextStyle(
                   fontSize: 20,
                   color: Color.fromARGB(255, 15, 16, 16)),
          ),
             ),
          )
        ],
      ),
    ),
    );
  }
}