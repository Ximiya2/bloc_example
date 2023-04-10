import 'package:bloc_example/bloc/users/users_cubit.dart';
import 'package:bloc_example/models/usersModel.dart';
import 'package:bloc_example/view/users/widgets/users_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/users/users_state.dart';

class UsersPage extends StatefulWidget {
   UsersPage({Key? key}) : super(key: key);


  @override
  State<UsersPage> createState() => _UsersPageState();
}
TextEditingController nameCtr = TextEditingController();


class _UsersPageState extends State<UsersPage> {

  List<UsersModel> users = [];

  @override
  void initState(){
    super.initState();
    BlocProvider.of<UsersCubit>(context).getUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Users', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: BlocBuilder<UsersCubit, UserState>(
        builder: (context, state) {
          if(state is UserError) {
            return Center(
              child: Text(''),
            );
          }

          if (state is UserLoading) {
            return viewUsers(users, true);
          }

          if (state is UserLoaded) {
            users = state.users!;

            return viewUsers(users, false);
          }
          return const Center(child: Text('Unknown error'));
        },
      )
    );
  }
  Widget viewUsers(List<UsersModel>users, bool isLoading) {
    return Stack(
      children: [
        ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, i){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: UsersItem(
                context,
                users[i]
              ),
            );
          }),
        isLoading ?
        const Center(child: CircularProgressIndicator())
            : const SizedBox()
      ]
    );
  }
}

