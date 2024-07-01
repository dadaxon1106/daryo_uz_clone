import 'dart:math';

import 'package:daryo_uz_clone/screens/detail_screen.dart';
import 'package:daryo_uz_clone/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/main_page_model.dart';

class LatestScreen extends StatefulWidget {
  const LatestScreen({super.key});

  @override
  State<LatestScreen> createState() => _LatestScreenState();
}

class _LatestScreenState extends State<LatestScreen> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLoading = true;
    });

    Future.delayed(const Duration(seconds: 2), () {
      setState(() {
        isLoading = false;
      });
    });

    shuffleList();
  }

  void shuffleList() {
    final random = Random();
    setState(() {
      posts.shuffle(random);
    });
  }

  List<NewsPost> posts = [
    NewsPost(
      title:
          "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "O‘zbekistonning ayrim hududlarida 1-iyul kuni yomg‘ir yog‘ishi mumkin",
      image:
          "https://daryo.uz/static/2024/06/30/photo_2024-06-30_16-05-46-E9_A0JJU.jpg",
      time: "17:13",
      views: "435",
    ),
    NewsPost(
      title:
          "Andijon viloyatining Marhamat tumanida to‘rtta avtomobil ishtirokida YTH sodir bo‘ldi",
      image:
          "https://daryo.uz/static/2024/07/01/photo_2021-04-30_11-22-56-FZZjduAm.jpg",
      time: "09:45",
      views: "122",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Column(
            children: List.generate(posts.length, (index) {
            return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailScreen(post: posts[index])));
                },
                child: makeHome(posts[index]));
          }));
  }

  Widget makeHome(NewsPost post) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      // height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12, width: 1.5),
      ),
      child: Column(
        children: [
          Image.network(
            post.image!,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 16,
                      width: 4,
                      color: Colors.blue,
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      "Mahalliy",
                      style: TextStyle(color: AppColors.subtitleColor),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                Text(
                  post.title!,
                  style: TextStyle(
                    color: AppColors.titleColor,
                    fontSize: 18,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      post.time!,
                      style: const TextStyle(
                          color: AppColors.subtitleColor, fontSize: 16),
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.remove_red_eye,
                          color: AppColors.subtitleColor,
                          size: 20,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          post.views!,
                          style: const TextStyle(
                              color: AppColors.subtitleColor, fontSize: 16),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
