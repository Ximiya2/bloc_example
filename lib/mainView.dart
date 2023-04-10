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
        backgroundColor: Colors.blueGrey,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.black,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Colors.black
        ),
        unselectedLabelStyle: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
            color: Colors.grey
        ),
      items: [
      BottomNavigationBarItem(
      icon: Icon(Icons.photo),
      label: 'Photo'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.post_add),
      label: 'Posts'
      ),
      BottomNavigationBarItem(
      icon: Icon(Icons.comment),
    label: 'Comment'
    ),
        BottomNavigationBarItem(
      icon: Icon(Icons.supervised_user_circle_outlined),
    label: 'Users'
    ),
    ],
    );
    }
    ),

    );
  }
}
