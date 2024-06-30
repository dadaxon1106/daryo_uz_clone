import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../models/main_page_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<NewsPost> posts = [
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
    NewsPost(title: "Shavkat Mirziyoyev taklifiga binoan BMT bosh kotibi Antoniu Guterrish 30-iyun kuni rasmiy tashrif bilan O‘zbekistonga keldi", image: "https://daryo.uz/static/2024/06/30/photo_2024-06-30_12-55-04-IYVB0Mut.jpg", time: "17:13", views: "435",),
  ];
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: List.generate(posts.length, (index){
        return makeHome(posts[index]);
      })
    );
  }

  Widget makeHome(NewsPost post){
    return Container(
      // height: 140,
      width: double.maxFinite,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12,width: 1.5),
      ),
      child: Column(
        children: [
          Image.network(post.image!,fit: BoxFit.cover,),
          Text("Mahalliy"),

          Text(post.title!),

          Text(post.views!),
          Text(post.time!),
        ],
      ),
    );
  }

}
