import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/modules/business_screen.dart';
import 'package:news_app/modules/apple_screen.dart';
import 'package:news_app/modules/street_news_screen.dart';
import 'package:news_app/shared/constents/constant.dart';
import 'package:news_app/shared/network/dio__helper.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitializeState());

  static HomeCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> pages = [
    BusinessScreen(),
    AppleNewsScreen(),
    StreetGournalScreen(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    emit(HomeChangeNavigationBarState());
  }

  late ArticleModel businessModel;
  List<dynamic> businessNews = [];

  List<dynamic> getBusinessData() {
    emit(HomeLoadingBusinessNewsState());
    DioHelper.getData(
      url: url,
      query: businessNewsQuery,
    ).then((value) {
      businessNews = value.data['articles'];
      // businessModel = ArticleModel.fromJson(value.data);
      emit(HomeSuccessBusinessNewsState());
    }).catchError((error) {
      emit(HomeErrorBusinessNewsState(error.toString()));
      print(error.toString());
    });
    return businessNews;
  }

  List<dynamic> appleNews = [];

  List<dynamic> getAppleData() {
    emit(HomeLoadingAppleNewsState());
    DioHelper.getData(
      url: url1,
      query: appleNewsQuery,
    ).then((value) {
      print(value.data.toString());
      appleNews = value.data['articles'];
      emit(HomeSuccessAppleNewsState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorAppleNewsState(error.toString()));
    });
    return appleNews;
  }

  List<dynamic> streetNews = [];

  List<dynamic> getStreetData() {
    emit(HomeLoadingStreetNewsState());
    DioHelper.getData(
      url: url1,
      query: streetNewsQuery,
    ).then((value) {
      print(value.data.toString());
      streetNews = value.data['articles'];
      emit(HomeSuccessStreetNewsState());
    }).catchError((error) {
      print(error.toString());
      emit(HomeErrorStreetNewsState(error.toString()));
    });
    return streetNews;
  }

  List<dynamic> search = [];

  List<dynamic> searchData( String value) {
    search = [];
    emit(HomeLoadingSearchNewsState());
    DioHelper.getData(
      url: url1,
      query: {
        'q':'$value',
        'apiKey':'f1c8c3abf96f4bbda5a7664d74e1af50',
      },
    ).then((value) {
      print(value.data.toString());
      search = value.data['articles'];
      emit(HomeSuccessSearchNewsState());
    }).catchError((error) {
      print(error.toString());
    });
    return search;
  }
}
