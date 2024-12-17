import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:flutter/material.dart';

class DeleteWidget extends StatefulWidget {
  const DeleteWidget({super.key});

  @override
  State<DeleteWidget> createState() => _DeleteWidgetState();
}

class _DeleteWidgetState extends State<DeleteWidget> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];
  dynamic _selectedMenu;

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  void _loadMenus() async {
    List<dynamic> menuData = await _menuModel.searchMenu();
    setState(() {
      _menus = menuData;
    });
  }

  void _onMenuSelected(dynamic menu) {
    setState(() {
      _selectedMenu = menu;
    });
  }

  void _deleteMenu() async {
    try {
      String result = await _menuModel.deleteMenu(_selectedMenu);
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(result)));
      Navigator.pushReplacementNamed(context, "/home");
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error : $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DropdownButton(
            value: _selectedMenu,
            hint: Text("메뉴 선택"),
            onChanged: (dynamic newValue) {
              _onMenuSelected(newValue);
            },
            items: _menus.map((dynamic menu) {
              return DropdownMenuItem(
                  value: menu, child: Text(menu['menuName']));
            }).toList()),
        ElevatedButton(onPressed: _deleteMenu, child: Text("메뉴 삭제하기"))
      ],
    ));
  }
}
