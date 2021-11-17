import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/web_view.dart';

Widget buildArticleItem(BuildContext context, var article) {
  return InkWell(
    onTap: () {
      navigation(context, WebView(article['url']));
    },
    child: Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 2.6,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                10.0,
              ),
              image: DecorationImage(
                image: NetworkImage("${article['urlToImage']}"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 20.0,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height / 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      "${article['title']}",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                  Text(
                    "${article['publishedAt']}",
                    style: TextStyle(color: Colors.grey, fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

void navigation(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget articleItem(List list, BuildContext context) {
  return ListView.builder(
    itemCount: list.length,
    itemBuilder: (context, index) => list.length > 0
        ? buildArticleItem(context, list[index])
        : Center(child: CircularProgressIndicator()),
  );
}

// Widget articleBuilder(list, context, {isSearch = false}) => ConditionalBuilder(
//   condition: list.length > 0,
//   builder: (context) =>
//       ListView.separated(
//         physics: BouncingScrollPhysics(),
//         itemBuilder: (context, index) => buildArticleItem(list[index], context),
//         separatorBuilder: (context, index) => Divider(),
//         itemCount: 10,),
//   fallback: (context) => isSearch ? Container() : Center(child: CircularProgressIndicator()),
// );

void navigateTo(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );

Widget buildArticle(BuildContext context, ArticleModel article) {
  return ListView.builder(
    itemCount: 5,
    itemBuilder: (context, index) => InkWell(
      onTap: () {
        navigation(context, WebView(article.articles[index].url));
      },
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width / 2.6,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  10.0,
                ),
                image: DecorationImage(
                  image: NetworkImage("${article.articles[index].urlToImage}"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height / 4,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        "${article.articles[index].title}",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w700),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 4,
                      ),
                    ),
                    Text(
                      "${article.articles[index].publishedAt}",
                      style: TextStyle(color: Colors.grey, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
