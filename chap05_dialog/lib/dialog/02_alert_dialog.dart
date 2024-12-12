import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogTest2 extends StatelessWidget {
  const DialogTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("Alert Dialog"),
                    content: Text("Are you sure? Really Really sure?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            // 취소 작업 실행
                            Navigator.of(context).pop();
                          },
                          child: Text("취소")),
                      TextButton(
                          onPressed: () {
                            // 확인 작업 실행
                            Navigator.of(context).pop(); // pop 은 닫기
                          },
                          child: Text("확인")),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text("data"))
                    ],
                  );
                });
          },
          child: Text(
            "버튼",
            style: TextStyle(fontSize: 30),
          )),
    );
  }
}

class DialogTest3 extends StatelessWidget {
  const DialogTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "버튼",
          style: TextStyle(fontSize: 30),
        ),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return CupertinoAlertDialog(
                  title: Text("알림창"),
                  content: Text("Are you REALLY REALLY sure?"),
                  actions: [
                    CupertinoDialogAction(
                      child: Text("취소"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                    CupertinoDialogAction(
                      child: Text("확인"),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                );
              });
        },
      ),
    );
  }
}
