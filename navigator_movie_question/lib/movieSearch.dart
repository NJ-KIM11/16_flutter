import 'package:flutter/material.dart';

class movieSearchPage extends StatefulWidget {
  late List<Map<String, dynamic>> movies;

  movieSearchPage({
    super.key,
    required this.movies,
  });

  @override
  State<movieSearchPage> createState() => _movieSearchPageState();
}

class _movieSearchPageState extends State<movieSearchPage> {
  late List movies;
  List _searchResults = [];

  @override
  void initState() {
    movies = widget.movies;
  }

  var inputData = TextEditingController();

  void _onSearch(String query) {
    setState(() {
      _searchResults = movies
          .where((movie) => (movie['title'] ?? '').contains(query))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: inputData,
          decoration: InputDecoration(labelText: "영화 검색"),
        ),
        ElevatedButton(
            child: Text("검색"),
            onPressed: () {
              _onSearch(inputData.text);
              inputData.clear();
            },
        ),
        _searchResults.length == 0
            ? Center(
                child: Text("검색 결과가 없습니다."),
              )
            : Expanded(
                child: ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, i) {
                      final result = _searchResults[i];
                      return ListTile(
                        title: Text(result['title']),
                        subtitle: Text(result['director']),
                      );
                    }))
      ],
    );
  }
}
