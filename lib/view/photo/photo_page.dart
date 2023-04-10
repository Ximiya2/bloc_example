import 'package:bloc_example/models/photosModel.dart';
import 'package:bloc_example/view/photo/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/photo/photo_cubit.dart';
import '../../bloc/photo/photo_state.dart';

class PhotoPage extends StatefulWidget {
  PhotoPage({Key? key}) : super(key: key);

  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  List<PhotosModel> photos = [];

  @override
  void initState(){
    super.initState();
    BlocProvider.of<PhotoCubit>(context).getPhoto();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: BlocBuilder<PhotoCubit, PhotoState>(
        builder: (context, state) {
          if(state is PhotoError) {
            return Center(
              child: Text(''),
            );
          }

          if (state is PhotoLoading) {
            return viewPhoto(photos, true);
          }

          if (state is PhotoLoaded) {
            photos = state.posts!;

            return viewPhoto(photos, false);
          }
          return const Center(child: Text('Unknown error'));
        },
      ),

    );
  }
  Widget viewPhoto(List<PhotosModel>photos, bool isLoading) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: GridView.builder(
        itemCount: photos.length,
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          return PhotoItem(
            context,
            photos[index],);
        },
      ),
    );
  }
}


/*
import 'package:dio_net_work/screen/photo/widgets/photo_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../service/photo_service.dart';

class PhotoPage extends StatefulWidget {
   PhotoPage({required int id,Key? key}) : super(key: key);
  int? id;
  @override
  State<PhotoPage> createState() => _PhotoPageState();
}

class _PhotoPageState extends State<PhotoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Photos', style: TextStyle(color: Colors.white),),
        centerTitle: true,),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: FutureBuilder(
          future: GetPhotoService.getPhoto(),
            builder: (context, snapshot){
              if(snapshot.hasData){
                return GridView.builder(
                  itemCount: snapshot.data!.length,
                    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                ),
                    itemBuilder: (context, index) {
                    return PhotoItem(snapshot.data![index],id: widget.id!);
              },
                );
              } else {
                return const Center(
                  child: Text('No data'),);
              }
            }),
      ),
    );
  }
}

*/
