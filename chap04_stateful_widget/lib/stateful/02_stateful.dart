import 'package:flutter/material.dart';

/*
*  StatefulWidget
*  - Flutter 에서 상태를 가진 위젯을 만들때 사용하는 클래스
*  - Flutter 위젯은 기본적으로 불변이지만,
*  StatefulWidget 을 사용하면 동적인 상태를 가진 위젯을
*  만들 수 있다. 위젯은 사용자 상호작용, 데이터 변화 등으로 인해
*  상태가 변경될 수 있고, 변경될 때 마다 UI가 다시 빌드된다.
* */

// 캡슐화의 원칙을 따라서 안전성을 지킨다.
// 직접 제어가 아니라 private 가 상속을 통해

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  @override
  State<StatefulTest> createState() => _StatefulTestState();
}

/*class _StatefulTestState extends State<StatefulTest> {
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Text(a.toString()),
        onPressed: (){
          print(a);
          a++;
        }
    );
  }
}*/

/*
*  state 를 변경시켜서 렌더링을 일으키려면 setState 를 알아야 한다.
*  Flutter 에서 setState()가 호출되면, 부분 렌더링이 발생한다.
*  즉, 전체 앱이나 전체 화면이 다시 렌더링 되는 것이 아니라,
*  상태가 변경된 특정 위젯만 다시 그려진다.
*
*  리액트는 돔 트리와 가상 돔 트리를 이용해 부분 렌더링을 하지만,
*  플러터는 위젯 트리에서 특정 상태를 관리하는 부분의 build 메소드만
*  다시 실행해 부분 렌더링 한다.
* */

class _StatefulTestState extends State<StatefulTest> {
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Text(a.toString()),
        onPressed: (){
          setState(() {
            a++;
          });
        }
    );
  }
}