import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/usersModel.dart';

Widget UsersItem(BuildContext context, UsersModel users,) {
  return SizedBox(
    height: 60,
    child: Center(
      child: Text(
      users.name,
      style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.black
      ),
      ),
    ),
  );
}