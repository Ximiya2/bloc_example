import 'package:bloc_example/bloc/comment/comment_cubit.dart';
import 'package:bloc_example/bloc/post/post_cubit.dart';
import 'package:bloc_example/bloc/users/users_cubit.dart';
import 'package:bloc_example/mainView.dart';
import 'package:bloc_example/view/posts/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'bloc/mainView/mainView_cubit.dart';
import 'bloc/photo/photo_cubit.dart';
import 'core/utils/app_init.dart';

void main() {
  AppInit.configLoading();
  runApp(MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PostCubit()),
        BlocProvider(create: (context) => MainViewCubit()),
        BlocProvider(create: (context) => PhotoCubit()),
        BlocProvider(create: (context) => CommentCubit()),
        BlocProvider(create: (context) => UsersCubit()),
      ],
      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MainView(),
    );
  }
}
/*
* add
* edit
*/