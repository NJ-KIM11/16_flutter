import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String menuName;
  final int menuPrice;
  final int categoryCode;
  final String orderableStatus;

  const DetailPage(
      {super.key,
      required this.menuName,
      required this.menuPrice,
      required this.categoryCode,
      required this.orderableStatus});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(menuName),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  "메뉴 이름 : $menuName",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [Text("가격 : $menuPrice")],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [Text("카테고리 코드 : $categoryCode")],
            ),
            SizedBox(
              height: 16,
            ),
            Row(
              children: [Text("주문 가능 상태 : $orderableStatus")],
            ),
          ],
        ),
      ),
    );
  }
}
