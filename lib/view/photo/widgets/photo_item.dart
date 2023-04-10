import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../models/photosModel.dart';

Widget PhotoItem(BuildContext context, PhotosModel photo,) {
  return Container(
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.all(5),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(8),
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 2,
          blurRadius: 5,
          offset: Offset(0, 3),
        )
      ]
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          photo.url,
          height: 130,
          fit: BoxFit.cover,
        ),
        SizedBox(height: 8,),
        Text(
          photo.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(fontSize: 16),
        )
      ],
    ),
  );
}