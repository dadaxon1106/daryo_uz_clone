import 'package:daryo_uz_clone/models/main_page_model.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final NewsPost post;
  const DetailScreen({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text(post.title!,textDirection: TextDirection.ltr,),
      ),
    );
  }
}
