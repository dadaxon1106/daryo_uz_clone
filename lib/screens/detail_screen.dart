import 'package:daryo_uz_clone/models/main_page_model.dart';
import 'package:daryo_uz_clone/screens/comments_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import '../utils/app_colors.dart';

class DetailScreen extends StatefulWidget {
  final NewsPost post;

  const DetailScreen({super.key, required this.post});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  int commentsNumber = 0;
  List<Widget> icons = [
    const Icon(
      CupertinoIcons.paperplane,
    ),
    const Icon(
      Icons.facebook,
    ),
    Image.asset(
      "assets/icons/insta_logo.png",
      height: 20,
    ),
    Image.asset("assets/icons/odno_logo.webp"),
    Image.asset("assets/icons/twitter_logo.png"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.grey.shade300,
        backgroundColor: Colors.grey.shade300,
        title: Text(
          widget.post.title!,
          textDirection: TextDirection.ltr,
        ),
        actions: [
          GestureDetector(
            onTap: () {
              ZoomDrawer.of(context)?.toggle(forceToggle: true);
            },
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
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 1.95,
            child: PageView(
              scrollDirection: Axis.vertical,
              children: [
                makeView(widget.post, context,
                    "Ko‘ksaroy qarorgohida BMT Bosh kotibi Antoniu Guterrishga jahonda hamjihatlik va birdamlikni faol ilgari surish, tashkilot faoliyati samaradorligini oshirish, shuningdek, mamlakatimiz va BMT o‘rtasidagi hamkorlikni mustahkamlashdagi xizmatlari uchun O‘zbekistonning oliy davlat mukofotlaridan biri - “Oliy darajali do‘stlik” ordenini tantanali topshirish marosimi bo‘lib o‘tdi."),
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(8),
        height: 66,
        decoration: BoxDecoration(
          border:
              const Border(top: BorderSide(color: Colors.black12, width: 1.5)),
          color: Colors.grey.shade300,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    CupertinoPageRoute(
                        builder: (context) => const CommentsScreen()));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.chat_outlined),
                  Text(
                    "Izohlar($commentsNumber)",
                    style: const TextStyle(color: AppColors.subtitleColor),
                  )
                ],
              ),
            ),
            const Column(
              children: [
                Icon(Icons.telegram),
                Text(
                  "Telegramm",
                  style: TextStyle(color: AppColors.subtitleColor),
                ),
              ],
            ),
            const Column(
              children: [
                Icon(Icons.share),
                Text(
                  "Ulashish",
                  style: TextStyle(color: AppColors.subtitleColor),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget makeView(NewsPost post, BuildContext context, String mainTExt) {
    return Column(
      children: [
        //# main news
        Container(
          height: MediaQuery.of(context).size.height * 1.06,
          width: double.maxFinite,
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26, width: 1.5),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
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
                          "MAHALLIY (O'ZB)",
                          style: TextStyle(
                              color: AppColors.subtitleColor, letterSpacing: 1),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          post.time!,
                          style: const TextStyle(
                              color: AppColors.subtitleColor, fontSize: 14),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.remove_red_eye,
                              color: AppColors.subtitleColor,
                              size: 18,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              post.views!,
                              style: const TextStyle(
                                  color: AppColors.subtitleColor, fontSize: 14),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      post.title!,
                      style: const TextStyle(fontSize: 19),
                    ),
                  ],
                ),
              ),
              Image.network(
                post.image!,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mainTExt,
                      style: const TextStyle(fontSize: 19),
                    ),
                    const SizedBox(height: 5),
                    const Divider(),
                    const SizedBox(height: 5),
                    const Text(
                      "Mavzuga Aloqador",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 4,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 8),
                        const Text(
                          "SSV yozda salomatlikni saqlash boyicha\ntavsiyalar berdi",
                          style: TextStyle(
                              color: AppColors.subtitleColor,
                              letterSpacing: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "9 Iyun, 08:10",
                      style: TextStyle(
                          color: AppColors.subtitleColor, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 4,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "SSV yozda salomatlikni saqlash boyicha\ntavsiyalar berdi",
                          style: TextStyle(
                              color: AppColors.subtitleColor,
                              letterSpacing: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "9 Iyun, 08:10",
                      style: TextStyle(
                          color: AppColors.subtitleColor, fontSize: 12),
                    ),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        Container(
                          height: 16,
                          width: 4,
                          color: Colors.blue,
                        ),
                        const SizedBox(width: 6),
                        const Text(
                          "SSV yozda salomatlikni saqlash boyicha\ntavsiyalar berdi",
                          style: TextStyle(
                              color: AppColors.subtitleColor,
                              letterSpacing: 1,
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              decoration: TextDecoration.underline),
                        ),
                      ],
                    ),
                    const SizedBox(height: 6),
                    const Text(
                      "9 Iyun, 08:10",
                      style: TextStyle(
                          color: AppColors.subtitleColor, fontSize: 12),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          height: 300,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/ads_image.jpg"),
            ),
          ),
        ),
        Container(
          height: 60,
          color: AppColors.subtitleColor,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(icons.length, (index) {
              return Container(
                padding: const EdgeInsets.all(8),
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white54,
                ),
                child: icons[index],
              );
            }),
          ),
        ),
        const SizedBox(height: 14),
        Container(
          height: 50,
          padding: const EdgeInsets.all(8),
          alignment: Alignment.centerLeft,
          width: double.maxFinite,
          color: AppColors.subtitleColor,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: const Text(
            "Asosiy Yangiliklar",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 14),

        Container(
          padding: const EdgeInsets.all(8),
          height: 164,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1.5),
            color: Colors.white54,
          ),
          child: Column(
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
                    "MAHALLIY (O'ZB)",
                    style: TextStyle(
                        color: AppColors.subtitleColor, letterSpacing: 1),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      post.title!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(post.image!))),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.time!,
                    style: const TextStyle(
                        color: AppColors.subtitleColor, fontSize: 14),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: AppColors.subtitleColor,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        post.views!,
                        style: const TextStyle(
                            color: AppColors.subtitleColor, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          height: 164,
          margin: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
          width: double.maxFinite,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black12, width: 1.5),
            color: Colors.white54,
          ),
          child: Column(
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
                    "MAHALLIY (O'ZB)",
                    style: TextStyle(
                        color: AppColors.subtitleColor, letterSpacing: 1),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      post.title!,
                      style: const TextStyle(
                          fontSize: 16, fontWeight: FontWeight.w500),
                      overflow: TextOverflow.clip,
                    ),
                  ),
                  Container(
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                        image:
                            DecorationImage(image: NetworkImage(post.image!))),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    post.time!,
                    style: const TextStyle(
                        color: AppColors.subtitleColor, fontSize: 14),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.remove_red_eye,
                        color: AppColors.subtitleColor,
                        size: 18,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        post.views!,
                        style: const TextStyle(
                            color: AppColors.subtitleColor, fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
