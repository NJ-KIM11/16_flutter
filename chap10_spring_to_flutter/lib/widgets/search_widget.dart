import 'package:chap10_spring_to_flutter/models/menu_model.dart';
import 'package:chap10_spring_to_flutter/widgets/detail_page.dart';
import 'package:flutter/material.dart';

class MenuSearchWidget extends StatefulWidget {
  const MenuSearchWidget({super.key});

  @override
  State<MenuSearchWidget> createState() => _MenuSearchWidgetState();
}

class _MenuSearchWidgetState extends State<MenuSearchWidget> {
  final MenuModel _menuModel = MenuModel();
  List<dynamic> _menus = [];

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

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _menus.length,
        itemBuilder: (context, i) {
          final menu = _menus[i];
          return ListTile(
            title: Text(menu['menuName']),
            subtitle: Text(menu['menuPrice'].toString()),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            menuName: menu['menuName'],
                            menuPrice: menu['menuPrice'],
                            categoryCode: menu['categoryCode'],
                            orderableStatus: menu['orderableStatus'],
                          )));
            },
          );
        });
  }
}
