import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_Cubit.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/modules/serach_screen.dart';
import 'package:news_app/shared/components/components.dart';
import 'package:news_app/shared/constents/constant.dart';
import 'package:news_app/shared/network/dio__helper.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit(),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              title: Text(
                "News",
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      navigateTo(context, SearchScreen());
                    },
                    icon: Icon(Icons.search,color: Colors.black,),)
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.teal,
              unselectedItemColor: Colors.grey[500],
              currentIndex: HomeCubit.get(context).currentIndex,
              type: BottomNavigationBarType.fixed,
              onTap: (index) {
                HomeCubit.get(context).changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.badge),
                  label: "Business",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.phone_iphone),
                  label: "Apple",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.wallpaper_rounded),
                  label: "Street Journal  ",
                ),
              ],
            ),
            body: HomeCubit.get(context)
                .pages[HomeCubit.get(context).currentIndex],
          );
        },
      ),
    );
  }
}
