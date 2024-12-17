import 'package:flutter/material.dart';

class movieListPage extends StatefulWidget {
  late List<Map<String, dynamic>> movies;
  late Function deleteMovie;

  movieListPage({
    super.key,
    required this.movies,
    required this.deleteMovie,
  });

  @override
  State<movieListPage> createState() => _movieListPageState();
}

class _movieListPageState extends State<movieListPage> {
  late List movies;
  late Function deleteMovie;

  @override
  void initState() {
    movies = widget.movies;
    deleteMovie = widget.deleteMovie;
  }

  @override
  Widget build(BuildContext context) {
    return movies.length == 0
        ? Center(
            child: Text("등록된 영화가 없습니다."),
          )
        : ListView.builder(
            itemCount: movies.length,
            itemBuilder: (context, i) {
              final movie = movies[i];
              return ListTile(
                title: Text(movie['title'] ?? "영화 제목 없음"),
                subtitle: Text(movie['director'] ?? "감독 이름 없음"),
                trailing: IconButton(
                    onPressed: () {
                      deleteMovie(movie);
                    },
                    icon: Icon(Icons.delete)),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                movieTitle: movie['title'] ??= "영화 제목 없음",
                                movieDirector: movie['director'] ??= "감독 이름 없음",
                                movieSummary: movie['summary'] ??= "줄거리 요약 없음",
                              )));
                },
              );
            });
  }
}

class DetailPage extends StatelessWidget {
  final String movieTitle;
  final String movieDirector;
  final String movieSummary;
  const DetailPage({
    super.key,
    required this.movieTitle,
    required this.movieDirector,
    required this.movieSummary,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
      ),
      body: Column(
        children: [
          Row(
            children: [Text("감독:"), Text(movieDirector)],
          ),
          Row(
            children: [Text("줄거리 요약:"), Text(movieSummary)],
          )
        ],
      ),
    );
  }
}
