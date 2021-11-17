import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/layout/layout.dart';
import 'package:news_app/layout/layout_screen.dart';
import 'package:news_app/shared/network/dio__helper.dart';

import 'layout/home_Cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  DioHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => HomeCubit()
        ..getBusinessData()
        ..getAppleData()
        ..getStreetData(),
      child: BlocConsumer<HomeCubit,HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            darkTheme:ThemeData(
              brightness: Brightness.dark,
              backgroundColor: Colors.black
            ) ,
            themeMode: ThemeMode.dark,
            theme: ThemeData(
              accentColor: Colors.teal,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                backgroundColor: Colors.white,
              ),
              tabBarTheme: TabBarTheme(
                labelColor: Colors.teal[700],
                unselectedLabelColor: Colors.grey
              ),
            ),
            debugShowCheckedModeBanner: false,
            home: News(),
          );
        },
      ),
    );
  }
}
