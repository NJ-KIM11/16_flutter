import 'package:chap11_provider/store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<Store>(context); // <> 제네릭으로 어느 클래스인지 표시(하나면 생략가능)
    var store2 = Provider.of<Store2>(context);

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("스토어 관리"),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "카운트1 값 : ${store.count}",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              "카운트2 값 : ${store2.count2}",
              style: TextStyle(fontSize: 30),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  store.incrementCount();
                },
                child: Text("카운트1 증가")),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  store2.incrementCount();
                },
                child: Text("카운트2 증가")),
          ],
        ),
      ),
    );
  }
}
