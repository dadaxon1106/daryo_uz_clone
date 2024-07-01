import 'dart:ui';

import 'package:daryo_uz_clone/screens/latest_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../../utils/app_colors.dart';
import 'home_screen.dart';

final List<String> list = ["Lotin", "Kирилл", "English", "Русский"];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  var controller = TextEditingController();

  int _currentIndex = 0;
  final ZoomDrawerController z = ZoomDrawerController();

  final listTexts = [
    [],
    [],
    [],
    [],
    [],
    ["Andion,Buxoro,Jizzax", "Namanga", "Fargona", "Sirdaryo", "Toshkent"],
    ["Asia", "North America"],
    ["Asia", "North America"],
    ["Asia", "North America"],
    ["Asia", "North America"],
    ["Asia", "North America"],
    ["Asia", "North America"],
  ];
  final colors = [
    Colors.blue,
    Colors.blue,
    Colors.blue,
    Colors.teal,
    Colors.brown,
    Colors.blue,
    Colors.red,
    Colors.teal,
    Colors.green,
    Colors.orange,
    Colors.yellow,
    Colors.black,
    Colors.black,
  ];
  final List<Widget> pages = [
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: HomeScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
    const SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: LatestScreen(),
    ),
  ];
  final List<String> _buttonTexts = [
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

  void _changePage(int newIndex) {
    if (_currentIndex != newIndex) {
      setState(() {
        _currentIndex = newIndex;
      });
    } else {
      z.toggle!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade300,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            showCupertinoModalPopup(
              barrierDismissible: false,
              context: context,
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 4.0),
              builder: (context) {
                return Container(
                  color: Colors.black26,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "What are we looking for?",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: TextDecoration.none,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 30),
                        child: CupertinoTextField(
                          controller: controller,
                        ),
                      ),
                      const SizedBox(height: 16),
                      controller.text.isEmpty
                          ? const SizedBox.shrink()
                          : Container(
                              height: 50,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 50),
                              decoration: BoxDecoration(
                                color: AppColors.subtitleColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Send",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ),
                    ],
                  ),
                );
              },
            );
          },
          child: const Icon(
            Icons.search,
            size: 30,
          ),
        ),
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
                fontWeight: FontWeight.w800,
              ),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            onTap: () {},
            child: Container(
              margin: const EdgeInsets.only(bottom: 10),
              height: 50,
              width: 50,
              color: Colors.white,
              child: const Center(
                child: Icon(Icons.menu),
              ),
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
      body: Column(
        children: [
          _currentIndex >= 5
              ? const SizedBox(height: 10)
              : const SizedBox.shrink(),
          _currentIndex >= 5
              ? makeType(colors[_currentIndex], _buttonTexts[_currentIndex])
              : const SizedBox.shrink(),
          Stack(
            children: [
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
                padding: const EdgeInsets.only(bottom: 20),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black12),
                  color: Colors.white,
                ),
                child: _currentIndex == 0
                    ? const SizedBox.shrink()
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.laptop),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.list),
                          ),
                        ],
                      ),
              ),
              DropdownButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                borderRadius: BorderRadius.circular(20),
                underline: const SizedBox.shrink(),
                onChanged: (value) {
                  setState(() {
                    // You should implement the logic here if needed
                  });
                },
                value: list.first,
                items: list.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: IndexedStack(
              index: _currentIndex,
              children: pages,
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(8),
        height: 72,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.blue, width: 1.5)),
        ),
        child: ListView.builder(
          itemCount: _buttonIcons.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => _changePage(index),
              child: Container(
                margin: const EdgeInsets.only(left: 30),
                child: Column(
                  children: [
                    Row(
                      children: [
                        index > 4
                            ? Container(
                                height: 16,
                                width: 4,
                                color: colors[index],
                              )
                            : const SizedBox.shrink(),
                        Icon(
                          _buttonIcons[index],
                          color: index == _currentIndex
                              ? Colors.blue
                              : AppColors.subtitleColor,
                          size: 28,
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      _buttonTexts[index],
                      style: TextStyle(
                        color: index == _currentIndex
                            ? Colors.blue
                            : AppColors.subtitleColor,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget makeType(Color myColor, String text) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      height: 40,
      width: double.maxFinite,
      decoration: BoxDecoration(
        color: myColor,
      ),
      child: Row(
        children: [
          Container(
            height: 16,
            width: 4,
            color: Colors.blue,
          ),
          const SizedBox(width: 4),
          Text(text),
        ],
      ),
    );
  }
}
