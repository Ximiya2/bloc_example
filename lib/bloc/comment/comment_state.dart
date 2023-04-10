import 'package:equatable/equatable.dart';
import '../../models/commentModel.dart';

abstract class CommentState extends Equatable {

  @override
  List<Object> get props => [];
}

class CommentInit extends CommentState{}

class CommentLoading extends CommentState{}

class CommentLoaded extends CommentState{

  final List<CommentModel>? posts;
  bool? isComment;

  CommentLoaded({this.posts, this.isComment});
}

class CommentError extends CommentState {
  final error;

  CommentError({this.error});
}