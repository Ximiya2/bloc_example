import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/post/post_state.dart';
import 'package:bloc_example/models/postModel.dart';
import 'package:bloc_example/service/comment_service.dart';
import 'package:bloc_example/service/post_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {
  CommentCubit() : super(CommentInit());

  void getComment() async {
    emit(CommentLoading());
    final response = await GetCommetService.getComment();

    response.fold((l) {
      emit(CommentError(error: l));
     EasyLoading.showError(l);
    }, (r) {
      emit(CommentLoaded(posts: r));
    });
  }
  //
  // void deleteComment(int id) async {
  //   emit(CommentLoading());
  //   final response = await GetCommetService.deleteComment(id);
  //
  //   response.fold((l) {
  //     //EasyLoading.showError(l);
  //     emit(CommentError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully deleted');
  //     getComment();
  //   });
  // }
  //
  // void editComment(CommentModel newComment) async {
  //   emit(CommentLoading());
  //   final response = await GetCommentService.editComment(newComment);
  //
  //   response.fold((l) {
  //     EasyLoading.showError(l);
  //     emit(CommentError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully edited');
  //     emit(CommentLoaded(isComment: r));
  //   });
  // }
  //
  // void addComment(CommentModel newComment) async {
  //   emit(CommentLoading());
  //   final response = await GetCommentService.addComment(newComment);
  //
  //   response.fold((l) {
  //     EasyLoading.showError(l);
  //     emit(CommentError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully add');
  //     emit(CommentLoaded(isComment: r));
  //   });
  // }
}