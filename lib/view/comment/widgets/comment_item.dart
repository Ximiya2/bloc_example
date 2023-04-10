import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../models/commentModel.dart';
import '../../../service/comment_service.dart';
import '../../../service/utils_service.dart';

Widget CommetItem({required BuildContext context, required CommentModel comment,
    /*required void Function() edit*/}) {
  return Column(
    children: [
      SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width*0.3,
              child: Text(
                comment.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                    color: Colors.black
                ),),
            ),
            SizedBox(width: 5,),
            SizedBox(
              width: MediaQuery.of(context).size.width*0.5,
              child: Text(
               '(${comment.email})',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                    color: Colors.blue
                ),),
            ),
          ],
        ),
      ),
      SizedBox(height: 10,),
      Row(
        children: [
          Expanded(
            child: Text(
            comment.body,
            maxLines: 6,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Colors.black38
            ),),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: (){},
                  icon: Icon(Icons.edit)),
              SizedBox(height: 10,),
              IconButton(
                  onPressed: () {
                    // bool result = await GetCommetService.deleteCommet(comment.id);
                    // if(result){
                    //   Utils.snackBarSucces('Deleted successfully', context);
                    // } else {
                    //   Utils.snackBarError('Someting is wrong', context);
                    // }
                  },
                  icon: Icon(Icons.delete)),
            ],
          )
        ],
      ),
    ],
  );
}