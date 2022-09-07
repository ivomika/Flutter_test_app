import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_app/pages/navPages/bar_item_page.dart';
import 'package:test_app/pages/navPages/home_page.dart';
import 'package:test_app/pages/navPages/my_page.dart';
import 'package:test_app/pages/navPages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];

  int currentIndex = 0;
  void tapHandler(int index) {
    setState((){
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: tapHandler,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey.withOpacity(.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.apps), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp), label: 'Bar'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'My'),
        ],
      ),
    );
  }
}
