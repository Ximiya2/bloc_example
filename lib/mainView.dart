import 'package:bloc_example/view/comment/comment_page.dart';
import 'package:bloc_example/view/photo/photo_page.dart';
import 'package:bloc_example/view/posts/posts_page.dart';
import 'package:bloc_example/view/users/users_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/mainView/mainView_cubit.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  var _pages = [
    PhotoPage(),
    PostsPage(),
    CommentPage(),
    UsersPage(),
  ];

   int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(title: Text('Main'),),
      body: BlocBuilder<MainViewCubit, int>(
        builder: (context, state) {
          return _pages[state];
        },
      ),


      bottomNavigationBar: BlocBuilder<MainViewCubit, int>(
    builder: (context, state) {
      return BottomNavigationBar(
      currentIndex: state,
      onTap: (index){
      BlocProvider.of<MainViewCubit>(context).upDateTab(index);
      },
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Colors.black,
      items: [
      BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Photo'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.search),
      label: 'Posts'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.photo_album),
    label: 'Commit'
    ),
        BottomNavigationBarItem(
      icon: Icon(Icons.photo_album),
    label: 'Users'
    ),
    ],
    );
    }
    ),

    );
  }
}
