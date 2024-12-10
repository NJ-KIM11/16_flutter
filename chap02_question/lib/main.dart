import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(title: 'Manchester United FanBase Forum'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
              onPressed: (){print("search button pressed");},
              icon: Icon(
                Icons.search,
                color: Colors.black,
              )),
          IconButton(
              onPressed: (){print("message button pressed");},
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black,
              )),
          IconButton(
              onPressed: (){print("settings button pressed");},
              icon: Icon(
                Icons.settings,
                color: Colors.black,
              )),
        ],
      ),

      body: Column(
        children: [
          Container(
            // height: 300,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Container(
                      child: Image.asset("assets/test1.jpg"),
                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),),
                      flex:2),
                  Flexible(child: Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                              children: [
                                Text("Old Trafford The Magnificent"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text("Stadium"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text("Spec"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Icon(Icons.favorite),
                                Text("999"),
                              ],
                            )
                        ),
                      ],
                    ),
                  ), flex: 5,
                  ),
                ],
              ),
          ),
          Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(child: Container(child: Image.asset("assets/test2.jpg"), margin: EdgeInsets.fromLTRB(20,0,20,20),), flex:2),
                  Flexible(child: Container(
                    child: Column(
                      children: [
                        Container(
                            child: Row(
                              children: [
                                Text("Old Trafford The Magnificent"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text("Stadium"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Text("Spec"),
                              ],
                            )
                        ),
                        Container(
                            child: Row(
                              children: [
                                Icon(Icons.favorite),
                                Text("999"),
                              ],
                            )
                        ),
                      ],
                    ),
                  ), flex: 5,
                  ),
                ],
              ),
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                onPressed: (){print("Home button pressed!!");},
                icon: Icon(Icons.home),
                color: Colors.white60,
            ),
            IconButton(
              onPressed: (){print("search button pressed!!");},
              icon: Icon(Icons.search),
              color: Colors.white60,
            ),
            IconButton(
              onPressed: (){print("alarm button pressed!!");},
              icon: Icon(Icons.alarm),
              color: Colors.white60,
            ),
            IconButton(
              onPressed: (){print("account button pressed!!");},
              icon: Icon(Icons.account_circle),
              color: Colors.white60,
            ),
          ],
        ),
      ),

    );
  }
}



