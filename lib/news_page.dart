import 'package:flutter/material.dart';
import 'package:news_app/detail_news.dart';
import 'package:news_app/service.dart';

import 'news_item.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("News Page"),
      ),

      body: FutureBuilder(
          future: Service.fetchArticle(),
          builder: (context, snapshot) {
            return snapshot.data != null
                ? buildListView(snapshot.data as List<Article>)
                : const Center(
                    child: CircularProgressIndicator(),
                  );
          }),
      // body: ,
    );
  }

  Widget buildListView(List<Article> articles) {
    return ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];
          return Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                final route = MaterialPageRoute(
                  builder: (context) => DetailNews(article: article),
                );
                Navigator.push(context, route);
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                elevation: 5,
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20)),
                      child: SizedBox(
                        width: double.infinity,
                        child: Image.network(
                          article.urlToImage,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15),
                      child: Text(
                        article.title,
                        textAlign: TextAlign.start,
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, bottom: 10),
                      child: Row(
                        children: [
                          SizedBox(
                            width: 100,
                            child: Text(
                              article.author,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          Text(
                            article.publishedAt.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey[400],
                                fontStyle: FontStyle.italic),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        });
  }
}
