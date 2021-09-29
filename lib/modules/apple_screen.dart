import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_Cubit.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/shared/components/components.dart';
class AppleNewsScreen extends StatelessWidget {
  const AppleNewsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubit.get(context).getAppleData();
        return articleItem(list, context);
      },
    );
  }
}
