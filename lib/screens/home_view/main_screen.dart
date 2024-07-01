import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../../utils/app_colors.dart';
import 'home_screen.dart';

final List<String> list = ["Lotin", "Kирилл", "English", "Русский"];

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _currentIndex = 0;

  String dropDown = list.first;


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
   SingleChildScrollView(
     padding: EdgeInsets.symmetric(horizontal: 20),
     child: const HomeScreen(),
   ),
    SingleChildScrollView(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: const HomeScreen(),
    ),
    const Text("Most read"),
    const Text("Columnists"),
    const Text("Multimedia"),
    const Text("Uzbekistan"),
    const Text("World"),
    const Text("Culture"),
    const Text("Lifestyle"),
    const Text('Sport'),
    const Text('Money'),
    const Text('Central Asia'),
  ];
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
    setState(() {
      _currentIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade300,
        centerTitle: true,
        leading: const Icon(
          Icons.search,
          size: 30,
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
            child: const Center(
              child: Icon(Icons.menu),
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
      body: Column(
        children: [
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
                child: _currentIndex == 0 ? SizedBox.shrink() : Row(
                  mainAxisAlignment: MainAxisAlignment.end,

                  children: [
                  IconButton(onPressed: (){}, icon: Icon(Icons.laptop),),
                  IconButton(onPressed: (){}, icon: Icon(Icons.list),),
                ],),
              ),
              
              DropdownButton(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                borderRadius: BorderRadius.circular(20),
                // icon: const Icon(Icons.arrow_forward_ios),
                underline: const SizedBox.shrink(),
                onChanged: (value) {
                  setState(() {
                    dropDown = value!;
                  });
                },
                value: dropDown,
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
            border: Border(top: BorderSide(color: Colors.blue, width: 1.5))),
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
                          index > 4 ? Container(
                            height: 16,
                            width: 4,
                            color: colors[index],
                          ) : const SizedBox.shrink(),
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
