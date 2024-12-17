import 'package:flutter/material.dart';
import 'package:navigator_movie_question/movieList.dart';
import 'package:navigator_movie_question/movieRegister.dart';
import 'package:navigator_movie_question/movieSearch.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  int _selectedIndex = 0;
  List<Map<String, dynamic>> movies = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addMovie(Map<String, dynamic> movie) {
    setState(() {
      movies.add(movie);
    });
  }

  void _deleteMovie(Map<String, dynamic> movie) {
    setState(() {
      movies.remove(movie);
    });
  }

  Widget _getPage() {
    switch (_selectedIndex) {
      case 0:
        return movieListPage(movies: movies, deleteMovie: _deleteMovie);
      case 1:
        return movieRegisterPage(
            addMovie: _addMovie, onItemTapped: _onItemTapped);
      case 2:
        return movieSearchPage(movies: movies);
      default:
        return Center(
          child: Text("페이지 없음"),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
          showSelectedLabels: true,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              label: "영화 목록",
              icon: Icon(Icons.list_outlined),
              activeIcon: Icon(Icons.list),
            ),
            BottomNavigationBarItem(
              label: "영화 등록",
              icon: Icon(Icons.add_outlined),
              activeIcon: Icon(Icons.add),
            ),
            BottomNavigationBarItem(
              label: "영화 검색",
              icon: Icon(Icons.search_outlined),
              activeIcon: Icon(Icons.search),
            ),
          ]),
    );
  }
}
