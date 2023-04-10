import 'package:equatable/equatable.dart';

import '../../models/postModel.dart';

abstract class PostState extends Equatable {

  @override
  List<Object> get props => [];
}

class PostInit extends PostState{}

class PostLoading extends PostState{}

class PostLoaded extends PostState{

  final List<PostModel>? posts;
  bool? isPost;

  PostLoaded({this.posts, this.isPost});
}

class PostError extends PostState {
  final error;

  PostError({this.error});
}