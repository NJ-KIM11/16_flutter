

import 'package:flutter/material.dart';

class MyBar extends StatelessWidget {
  const MyBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Manchester United Fan Forum",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        actions: [      // 오른쪽에 생성
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.favorite_border,
                color: Colors.black,
            )),
          IconButton(
              onPressed: (){},
              icon: Icon(
                Icons.message_outlined,
                color: Colors.black,
              )),
        ],
      ),

      body: Column(
        children: [
          Expanded(   // 꽉 채움
              child: Container(
                color: Colors.blueAccent,
              )),
          Container(
            height: 100,
            child: Row(
              children: [
                Flexible(child: Container(color: Colors.yellow,), flex: 1,),  // 차지할 비율 선택
                Flexible(child: Container(color: Colors.green,), flex: 2,),
              ],
            ),
          )
        ],
      ),

      bottomNavigationBar: BottomAppBar(
        color: Colors.redAccent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.home),
              color: Colors.white,
            ),
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.search),
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
