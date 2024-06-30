import 'package:daryo_uz_clone/screens/home_view/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../utils/app_colors.dart';

const List<String> list = ["Lotin", "Kирилл", "English", "Русский"];
enum SampleItem { itemOne, itemTwo, itemThree }


class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  SampleItem? item;
  final GlobalKey<PopupMenuButtonState> _menuKey = GlobalKey();
  int _selectIndex = 0;
  String dropDown = list.first;


  int _currentIndex = 0;
  List<Widget> pages = [];

  Widget? _pageIndex;
  @override
  void initState() {
    super.initState();
    pages
      ..add(const HomeView())
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const Text("Main"))
      ..add(const  Text("Most read"));

    _pageIndex = const HomeScreen();
  }

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

  static const List<Widget> _widgetOptions = [
    Text("Main"),
    HomeScreen(),
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
            child:const Center(
              child: Icon(Icons.menu),
            ),
          ),
        ],
        backgroundColor: Colors.grey.shade300,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [
              Stack(
                children:[
                  Container(
                    padding: const EdgeInsets.all(8),
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      color: Colors.white,
                    ),
                  ),
                  DropdownButton(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
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
                ]
              ),
              const SizedBox(height: 10),
              _pageIndex!,
            ],
          ),
        ),
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
                      Icon(
                        _buttonIcons[index],
                        color: index == _currentIndex
                            ? Colors.blue
                            : AppColors.subtitleColor,
                        size: 28,
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
  void _changePage(int currentIndex) {
    setState(() {
      _currentIndex = currentIndex;
      _pageIndex = pages[currentIndex];
    });
  }
}
