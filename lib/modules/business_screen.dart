import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_Cubit.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/shared/components/components.dart';

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubit.get(context).getBusinessData();
        return state == HomeLoadingBusinessNewsState()
            ? Center(child: CircularProgressIndicator())
            : articleItem(list, context);
        // ArticleModel model = HomeCubit.get(context).businessModel;
        // return state == HomeLoadingBusinessNewsState()?
        // Center(child: CircularProgressIndicator()):
        // buildArticle(context,model);
      },
    );
  }
}
