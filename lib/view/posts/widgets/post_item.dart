import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../bloc/post/post_cubit.dart';
import '../../../models/postModel.dart';

Widget postItem({required BuildContext context, required PostModel post, required void Function() edit,/* required int comment*/}) {
  return Column(
    children: [
      Text(
        post.title??'',
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24,
          color: Colors.black
        ),
      ),
      SizedBox(height: 5,),
      Row(
        children: [
          Expanded(
              child: Text(
                post.body??'',
                maxLines: 5,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                    color: Colors.black38
                ),
              ),
          ),
          Column(
            children: [
              IconButton(
                  onPressed: edit,
                  icon: Icon(Icons.edit)),
              SizedBox(height: 10,),
              IconButton(
                  onPressed: () {
                    BlocProvider.of<PostCubit>(context).deletePost(post.id??1);
                  },
                  icon: Icon(Icons.delete)),
            ],
          ),
        ],
      ),
      Row(
        children: [
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.favorite_border)),
          SizedBox(width: 10,),
          IconButton(
            onPressed: (){},
              // onPressed: (){
              //   showModalBottomSheet(
              //     backgroundColor: Colors.white,
              //     context: context,
              //     builder: (context) => StatefulBuilder(
              //       builder: (BuildContext context, void Function(void Function()) setState) {
              //         return Padding(
              //           padding: const EdgeInsets.all(16.0),
              //           child: FutureBuilder(
              //               future: GetCommetService.getPostComment(post.id),
              //               builder: (context, snapshot){
              //                 if(snapshot.hasData){
              //                   return ListView.builder(
              //                       itemCount: snapshot.data!.length,
              //                       itemBuilder: (context, i){
              //                         return Padding(
              //                           padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              //                           child: PostCommetItem(
              //                             context: context,
              //                             comment:  snapshot.data![i],
              //                           ),
              //                         );
              //                       });
              //                 } else {
              //                   return const Center(
              //                     child: Text('No data'),);
              //                 }
              //               }),
              //         );
              //          /* Container(
              //           decoration: BoxDecoration(
              //               color: Colors.grey.shade800,
              //               borderRadius: BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20))
              //           ),
              //           height: MediaQuery.of(context).size.height * 0.5,
              //           child: Padding(
              //             padding: const EdgeInsets.all(15.0),
              //             child: Column(
              //               children: [
              //                 Center(
              //                   child: Container(
              //                     height: 4,
              //                     width: 35,
              //                     decoration: BoxDecoration(
              //                       color: Colors.grey.shade50,
              //                       borderRadius: BorderRadius.circular(40),
              //                     ),
              //                   ),
              //                 ),
              //                 SizedBox(height: 20,),
              //                 Row(
              //                   children: [
              //                     Column(
              //                       children: [
              //                         Container(
              //                           child: Icon(Icons.share_outlined, color: Colors.white,),
              //                           height: 55,
              //                           width: 55,
              //                           decoration: BoxDecoration(
              //                               color:  Colors.transparent,
              //                               borderRadius: BorderRadius.circular(70),
              //                               border: Border.all(
              //                                   width: 1,
              //                                   color: Colors.white
              //                               )
              //                           ),
              //                         ),
              //                         SizedBox(height: 5,),
              //                         Text('Share', style: TextStyle(color: Colors.white),),
              //                       ],
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 20),
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             child: Icon(Icons.link, color: Colors.white,),
              //                             height: 55,
              //                             width: 55,
              //                             decoration: BoxDecoration(
              //                                 color:  Colors.transparent,
              //                                 borderRadius: BorderRadius.circular(70),
              //                                 border: Border.all(
              //                                     width: 1,
              //                                     color: Colors.white
              //                                 )
              //                             ),
              //                           ),
              //                           SizedBox(height: 5,),
              //                           Text('Link', style: TextStyle(color: Colors.white),),
              //                         ],
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 20),
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             child: Icon(Icons.save, color: Colors.white,),
              //                             height: 55,
              //                             width: 55,
              //                             decoration: BoxDecoration(
              //                                 color:  Colors.transparent,
              //                                 borderRadius: BorderRadius.circular(70),
              //                                 border: Border.all(
              //                                     width: 1,
              //                                     color: Colors.white
              //                                 )
              //                             ),
              //                           ),
              //                           SizedBox(height: 5,),
              //                           Text('Save', style: TextStyle(color: Colors.white),),
              //                         ],
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 20),
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             child: Icon(Icons.repeat, color: Colors.white,),
              //                             height: 55,
              //                             width: 55,
              //                             decoration: BoxDecoration(
              //                                 color:  Colors.transparent,
              //                                 borderRadius: BorderRadius.circular(70),
              //                                 border: Border.all(
              //                                     width: 1,
              //                                     color: Colors.white
              //                                 )
              //                             ),
              //                           ),
              //                           SizedBox(height: 5,),
              //                           Text('Remix', style: TextStyle(color: Colors.white),),
              //                         ],
              //                       ),
              //                     ),
              //                     Padding(
              //                       padding: const EdgeInsets.only(left: 20),
              //                       child: Column(
              //                         children: [
              //                           Container(
              //                             child: Icon(Icons.qr_code_scanner, color: Colors.white,),
              //                             height: 55,
              //                             width: 55,
              //                             decoration: BoxDecoration(
              //                                 color:  Colors.transparent,
              //                                 borderRadius: BorderRadius.circular(70),
              //                                 border: Border.all(
              //                                     width: 1,
              //                                     color: Colors.white
              //                                 )
              //                             ),
              //                           ),
              //                           SizedBox(height: 5,),
              //                           Text('QR code', style: TextStyle(color: Colors.white),),
              //                         ],
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //                 SizedBox(height: 10,),
              //                 Divider(
              //                   thickness: 0,
              //                   color: Colors.grey,
              //                 ),
              //                 SizedBox(height: 10,),
              //                 InkWell(
              //                   child: Row(
              //                     children: [
              //                       Icon(Icons.star_border,color: Colors.white, size: 28,),
              //                       SizedBox(width: 20,),
              //                       Text('Add to favorites', style: TextStyle(fontSize: 18,color: Colors.white ),),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(height: 15,),
              //                 InkWell(
              //                   child: Row(
              //                     children: [
              //                       Icon(Icons.person_remove_outlined,color: Colors.white, size: 28,),
              //                       SizedBox(width: 20,),
              //                       Text('Unfolow', style: TextStyle(fontSize: 18,color: Colors.white ),),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(height: 10,),
              //                 Divider(
              //                   thickness: 0,
              //                   color: Colors.grey,
              //                 ),
              //                 SizedBox(height: 10,),
              //                 InkWell(
              //                   child: Row(
              //                     children: [
              //                       Icon(Icons.circle_notifications_outlined ,color: Colors.white, size: 28,),
              //                       SizedBox(width: 20,),
              //                       Text('Why you\`re seeing this post', style: TextStyle(fontSize: 18,color: Colors.white ),),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(height: 15,),
              //                 InkWell(
              //                   child: Row(
              //                     children: [
              //                       Icon(Icons.not_interested,color: Colors.white, size: 28,),
              //                       SizedBox(width: 20,),
              //                       Text('Hide', style: TextStyle(fontSize: 18,color: Colors.white ),),
              //                     ],
              //                   ),
              //                 ),
              //                 SizedBox(height: 15,),
              //                 InkWell(
              //                   child: Row(
              //                     children: [
              //                       Icon(Icons.message_outlined,color: Colors.redAccent, size: 28,),
              //                       SizedBox(width: 20,),
              //                       Text('Report', style: TextStyle(fontSize: 18,color: Colors.redAccent ),),
              //                     ],
              //                   ),
              //                 ),
              //               ],
              //             ),
              //           ),
              //         );*/
              //       },
              //     ),
              //   );
              // },
              icon: Icon(Icons.comment)),
          SizedBox(width: 10,),
          IconButton(
              onPressed: (){},
              icon: Icon(Icons.send)),
        ],
      ),
      Divider(thickness: 1,)
    ],
  );
}
