import 'package:flutter/material.dart';

class movieRegisterPage extends StatelessWidget {
  late Function addMovie;
  late Function onItemTapped;

  movieRegisterPage({
    super.key,
    required this.addMovie,
    required this.onItemTapped,
  });

  var inputData1 = TextEditingController();
  var inputData2 = TextEditingController();
  var inputData3 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: inputData1,
          decoration: InputDecoration(labelText: "영화 제목"),
        ),
        TextField(
          controller: inputData2,
          decoration: InputDecoration(labelText: "감독"),
        ),
        TextField(
          controller: inputData3,
          decoration: InputDecoration(labelText: "내용"),
        ),
        ElevatedButton(
          child: Text("영화 등록"),
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text("영화 등록"),
                    content: Text("정말 등록 하시겠습니까?"),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text("취소")),
                      TextButton(
                          onPressed: () {
                            Map<String, dynamic> movie = {
                              "title": null,
                              "director": null,
                              "summary": null
                            };
                            movie['title'] = inputData1.text;
                            movie['director'] = inputData2.text;
                            movie['summary'] = inputData3.text;
                            addMovie(movie);
                            Navigator.pop(context);
                          },
                          child: Text("등록")),
                    ],
                  );
                });
            onItemTapped(0);
          },
        )
      ],
    );
  }
}
