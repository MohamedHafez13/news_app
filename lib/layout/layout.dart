import 'package:flutter/material.dart';
import 'package:news_app/modules/apple_screen.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/serach_screen.dart';
import 'package:news_app/modules/street_news_screen.dart';
import 'package:news_app/shared/components/components.dart';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  _NewsState createState() => _NewsState();
}

class _NewsState extends State<News> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    // TODO: implement initState
    controller = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "News",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              navigateTo(context, SearchScreen());
            },
            icon: Icon(
              Icons.search,
              color: Colors.white,
            ),
          )
        ],
        bottom: TabBar(
          controller: controller,
          tabs: [
            Tab(
              text: "Business",
              icon: Icon(Icons.badge),
            ),
            Tab(
              text: "Apple",
              icon: Icon(Icons.phone_iphone),
            ),
            Tab(
              text: "Street Journal",
              icon: Icon(Icons.wallpaper_rounded),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: controller,
        children: [
          BusinessScreen(),
          AppleNewsScreen(),
          StreetGournalScreen(),
        ],
      ),
    );
  }
}
