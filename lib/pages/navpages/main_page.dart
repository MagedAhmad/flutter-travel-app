import 'package:flutter/material.dart';
import 'package:my_app/pages/navpages/my_page.dart';
import 'package:my_app/pages/home_page.dart';
import 'package:my_app/pages/navpages/search_page.dart';
import 'package:my_app/pages/navpages/bar_item_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List page = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage()
  ];

  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: page[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: const [
          BottomNavigationBarItem(label: "home", icon: Icon(Icons.apps)),
          BottomNavigationBarItem(label: "bar", icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(label: "search", icon: Icon(Icons.search)),
          BottomNavigationBarItem(label: "my", icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
