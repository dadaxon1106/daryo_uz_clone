import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectIndex = 0;

  List<String> _buttonTexts = [
    "Main",
    "Latest",
    "Most read",
    "Columnists",
    "Multimedia",
    "Uzbekistan",
    "World",
    "Culture",
    "Lifestyle",
    "Sport",
    "Money",
    "Central Asia",
  ];

  static List<Widget> _widgetOptions = [
    Text("Main"),
    Text("Latest"),
    Text("Most read"),
    Text("Columnists"),
    Text("Multimedia"),
    Text("Uzbekistan"),
    Text("World"),
    Text("Culture"),
    Text("Lifestyle"),
    Text('Sport'),
    Text('Money'),
    Text('Central Asia')
  ];

  final List<IconData> _buttonIcons = [
    CupertinoIcons.list_bullet_below_rectangle,
    CupertinoIcons.line_horizontal_3_decrease,
    Icons.remove_red_eye_sharp,
    CupertinoIcons.pen,
    CupertinoIcons.play_rectangle,
    Icons.home,
    Icons.sports_baseball,
    Icons.book_sharp,
    Icons.tag,
    Icons.sports_volleyball,
    Icons.shopping_bag_outlined,
    Icons.sports_baseball,
  ];

  void _onTapItem(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                "assets/images/daryo_logo.png",
              ),
              height: 40,
            ),
            const SizedBox(width: 10),
            Text(
              "DARYO",
              style: TextStyle(
                  color: AppColors.titleColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w800),
            ),
          ],
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            height: 50,
            width: 50,
            color: Colors.white,
            child: Center(
              child: Icon(Icons.menu),
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectIndex),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        height: 72,
        decoration: const BoxDecoration(
            color: Colors.white,
            border: Border(top: BorderSide(color: Colors.blue, width: 1.5))),
        child: ListView.builder(
            itemCount: _buttonIcons.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => _onTapItem(index),
                child: Container(
                  margin: const EdgeInsets.only(left: 30),
                  child: Column(
                    children: [
                      Icon(
                        _buttonIcons[index],
                        color: index == _selectIndex
                            ? Colors.blue
                            : AppColors.subtitleColor,
                        size: 28,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        _buttonTexts[index],
                        style: TextStyle(
                            color: index == _selectIndex
                                ? Colors.blue
                                : AppColors.subtitleColor),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
