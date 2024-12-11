import 'package:flutter/material.dart';

class ListViewStatefulWidget extends StatefulWidget {
  const ListViewStatefulWidget({super.key});

  @override
  State<ListViewStatefulWidget> createState() => _ListViewStatefulWidgetState();
}

class _ListViewStatefulWidgetState extends State<ListViewStatefulWidget> {
  List<String> foods = ["피자","돈까스","치킨"];
  List<int> num = [0,0,0];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 3,
        itemBuilder: (context, i){
          return ListTile(
            leading: Text(num[i].toString()),
            title: Text(foods[i]),
            trailing: ElevatedButton(
                onPressed: (){
                  setState(() {
                    num[i]++;
                  });
                },
                child: Text("좋아용")),
          );
        }
    );
  }
}
