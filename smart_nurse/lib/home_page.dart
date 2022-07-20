import 'package:flutter/material.dart';
import 'package:smart_nurse/notification.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: 300,
              padding: EdgeInsets.only(top:25, left: 20, right: 30),
              child:
              FittedBox(
                child: Image.asset("images/nurse3.png"),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child:
              Align(
                alignment: Alignment.topLeft,
                child: Text("Smart Button", style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 84, 145, 158)
                ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>notificationPage(
    )));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                            child: FittedBox(
                                child: Image.asset("images/infus.png"),
                              fit: BoxFit.fitWidth,
                            )
                          ),
                        ),
                        Container(
                          child: Text("Infus", style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 84, 145, 158)
                          ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                notificationPage(
                                )));
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  notificationPage(
                                  )));
                            },
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) =>
                                        notificationPage(
                                        )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    height: 100,
                                    width: 100,
                                    child: FittedBox(
                                      child: Image.asset("images/cleaning.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Request Cleaning", style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 84, 145, 158)
                                  ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                notificationPage(
                                )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            child: FittedBox(
                              child:Image.asset("images/file.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          child: Text("Rekam Medis", style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 84, 145, 158)
                          ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                notificationPage(
                                )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                            ),
                            margin: EdgeInsets.all(10),
                            height: 100,
                            width: 100,
                            child: FittedBox(
                              child:Image.asset("images/food.png"),
                              fit: BoxFit.fitWidth,
                            ),
                          ),
                        ),
                        Container(
                          child: Text("Request Menu", style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 84, 145, 158)
                          ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child:
              Align(
                alignment: Alignment.topLeft,
                child: Text("Emergency Button", style: TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 84, 145, 158)
                ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children:[
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>notificationPage(
                            )));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              margin: EdgeInsets.all(10),
                              height: 100,
                              width: 100,
                              child: FittedBox(
                                child: Image.asset("images/bloodTranfusion.png"),
                                fit: BoxFit.fitWidth,
                              )
                          ),
                        ),
                        Container(
                          child: Text("Tranfusi Darah", style: TextStyle(
                              fontSize: 13,
                              color: Color.fromARGB(255, 84, 145, 158)
                          ),
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                notificationPage(
                                )));
                          },
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) =>
                                  notificationPage(
                                  )));
                            },
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) =>
                                        notificationPage(
                                        )));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    margin: EdgeInsets.all(10),
                                    height: 100,
                                    width: 100,
                                    child: FittedBox(
                                      child: Image.asset("images/oxygen.png"),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                                Container(
                                  child: Text("Oxygen", style: TextStyle(
                                      fontSize: 13,
                                      color: Color.fromARGB(255, 84, 145, 158)
                                  ),
                                  ),
                                ),
                              ],
                            ),
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
    );
  }
}