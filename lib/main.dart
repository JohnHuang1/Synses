import 'package:flutter/material.dart';
import './graphs_page.dart';
import './history_page.dart';
import './input_page.dart';

class Synses extends StatefulWidget {
  @override
  _SynsesState createState() => new _SynsesState();
}

class _SynsesState extends State<Synses> {
  int _pageIndex = 0;
  late PageController _pageController;

  List<Widget> tabPages = [
    InputPage(),
    GraphPage(),
    HistoryPage(),
  ];
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _pageIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: bottomMenu(),
    );
  }

  Widget bottomMenu() {
    return Scaffold(
      appBar: AppBar(
        title:
        Text("BottomNavigationBar", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.deepPurple,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: onTabTapped,
        backgroundColor: Colors.white,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Input"),
          BottomNavigationBarItem(icon: Icon(Icons.mail), label: "Graphs"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "History"),
        ],
      ),
      body: PageView(
        children: tabPages,
        onPageChanged: onPageChanged,
        controller: _pageController,
      ),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
  }
}

void main() {
  runApp(Synses());
}