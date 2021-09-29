import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/home_Cubit.dart';
import 'package:news_app/layout/home_states.dart';
import 'package:news_app/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  TextEditingController search = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = HomeCubit.get(context).search;
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            elevation: 0,
          ),
          body: Column(
            children: [
              Form(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextFormField(
                    controller: search,
                    decoration: InputDecoration(
                      labelText: "Search",
                      border: OutlineInputBorder(),
                      hintText: "Search",
                      prefixIcon: Icon(Icons.search),
                    ),
                    onChanged: (String value) {
                      HomeCubit.get(context).searchData(value);
                    },
                  ),
                ),
              ),
              Expanded(
                child: articleItem(list, context),
              ),
            ],
          ),
        );
      },
    );
  }
}
