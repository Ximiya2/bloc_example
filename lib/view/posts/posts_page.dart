import 'package:bloc_example/bloc/post/post_cubit.dart';
import 'package:bloc_example/bloc/post/post_state.dart';
import 'package:bloc_example/view/posts/widgets/post_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../models/postModel.dart';

class PostsPage extends StatefulWidget {
   PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {

  TextEditingController userIdCtr = TextEditingController();
  TextEditingController titleCtr = TextEditingController();
  TextEditingController bodyCtr = TextEditingController();

  List<PostModel> posts = [];

  @override
  void initState(){
    super.initState();
    BlocProvider.of<PostCubit>(context).getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Posts', style: TextStyle(color: Colors.white),),
        actions: [
          IconButton(
            onPressed: (){
              _showBottomSheet(
                  context,
                      () async {
                if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                  PostModel newPost = PostModel(
                      userId: int.parse(userIdCtr.text),
                      id: 1,
                      title: titleCtr.text,
                      body: bodyCtr.text);
                  BlocProvider.of<PostCubit>(context).addPost(newPost);
                 }
                Navigator.pop(context);
              });
            },
            icon: Icon(Icons.add),
          ),
        ],
        centerTitle: true,
      ),
      body: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if(state is PostError) {
            return Center(
              child: Text(''),
            );
          }

          if (state is PostLoading) {
            return viewHome(posts, true);
          }

          if (state is PostLoaded) {
            posts = state.posts!;

            return viewHome(posts, false);
          }
          return const Center(child: Text('Unknown error'));
        },
      )
    );
  }

  Widget viewHome(List<PostModel>posts, bool isLoading) {
    return Stack(
      children: [
        ListView.builder(
            itemBuilder: (context, index){
              return Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 10, horizontal: 15),
                child: postItem(
                  context: context,
                  post: posts[index],
                  edit: (){
                    userIdCtr.text = posts[index].userId.toString();
                    titleCtr.text = posts[index].title??'';
                    bodyCtr.text = posts[index].body??'';
                    _showBottomSheet(
                        context,
                            () async {
                          if(userIdCtr.text.isNotEmpty && titleCtr.text.isNotEmpty && bodyCtr.text.isNotEmpty) {
                            PostModel newPost = PostModel(
                                userId: int.parse(userIdCtr.text),
                                id: posts[index].id,
                                title: titleCtr.text,
                                body: bodyCtr.text
                            );
                            BlocProvider.of<PostCubit>(context).editPost(newPost);
                          }
                          Navigator.pop(context);
                        });
                  }
                  ,),
              );
            }
        ),
        isLoading ?
        const Center(child: CircularProgressIndicator())
            : const SizedBox()
      ],
    );
  }

  void _showBottomSheet(BuildContext context, void Function() func) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context,) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text(
                    'Add new post',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                  TextFormField(
                    controller: userIdCtr,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: 'UserId'),
                  ),
                  TextFormField(
                    controller: titleCtr,
                    decoration: InputDecoration(labelText: 'Age'),
                  ),
                  TextFormField(
                    controller: bodyCtr,
                    decoration: InputDecoration(labelText: 'Salary'),
                  ),
                  ElevatedButton(
                    onPressed: func,
                    child: Text('Add'),
                  ),
                  SizedBox(height: 400,)
                ],
              ),
            ),
          );
        });
  }
}


