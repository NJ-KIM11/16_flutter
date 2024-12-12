import 'package:flutter/material.dart';

class DialogQuestionTest extends StatefulWidget {
  const DialogQuestionTest({super.key});

  @override
  State<DialogQuestionTest> createState() => _DialogQuestionTestState();
}

class _DialogQuestionTestState extends State<DialogQuestionTest> {
  List<Map<String, dynamic>> postlist = [];

  var inputData1 = TextEditingController();
  var inputData2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(
          child: Text("ToDo 리스트"),
          ),
        ),

      body:
      ListView.builder(
        itemCount: postlist.length,
        itemBuilder: (context, i){
          return ListTile(
            onTap: (){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text(postlist[i]['title']),
                      content: Text(postlist[i]['content']),
                      actions: [
                        TextButton(
                            onPressed: (){
                              Navigator.pop(context);
                            },
                            child: Text("닫기"))
                      ],
                    );
                  });
            },
            leading: Text(i.toString()),
            title: Text(postlist[i]['title']),
            trailing: TextButton(
                onPressed: (){
                  setState(() {
                    postlist.removeAt(i);
                  });
                }, child: Text("삭제")),
          );
        }),

      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        // alignment: Alignment.bottomRight,    // 위에거 밀어내서 문제 많이 생김
        children: [TextButton(
          child: Text("등록", style: TextStyle(fontSize: 50),),
                onPressed: (){
                  showDialog(
                    context: context,
                    builder: (context){
                      return AlertDialog(
                        title: Text("일정 등록"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: inputData1,
                              decoration: InputDecoration(
                              labelText: "제목을 입력하세요"
                              ),
                            ),
                            TextField(
                              controller: inputData2,
                              decoration: InputDecoration(
                              labelText: "상세 내용을 입력하세요"
                              ),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: (){
                              inputData1.clear();
                              inputData2.clear();
                            Navigator.pop(context);
                          },
                            child: Text("취소")),
                          TextButton(
                            onPressed: (){
                              setState(() {
                                if(inputData1.text.length > 0 && inputData2.text.length > 0){
                                  Map<String, dynamic> post = {};
                                  post['title'] = inputData1.text;
                                  post['content'] = inputData2.text;
                                  inputData1.clear();
                                  inputData2.clear();
                                  postlist.add(post);
                                  Navigator.pop(context);
                                }
                              });

                            },
                            child: Text("완료")),
                        ],
                        );
                    });
            },),]
    ),
    );
  }
}



