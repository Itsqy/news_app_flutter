import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_app/news_item.dart';

class DetailNews extends StatelessWidget {
  final Article article;
  const DetailNews({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("News Page"),
      ),
      body: Column(children: [
        Image.network(article.urlToImage),
        Text(article.description),
        Text(article.author)
      ]),
    );
  }
}
