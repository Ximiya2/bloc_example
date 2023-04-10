import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/post/post_state.dart';
import 'package:bloc_example/models/postModel.dart';
import 'package:bloc_example/service/comment_service.dart';
import 'package:bloc_example/service/post_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../service/users_service.dart';
import 'users_state.dart';

class UsersCubit extends Cubit<UserState> {
  UsersCubit() : super(UserInit());

  void getUser() async {
    emit(UserLoading());
    final response = await GetUsersService.getUsers();

    response.fold((l) {
      emit(UserError(error: l));
     EasyLoading.showError(l);
    }, (r) {
      emit(UserLoaded(users: r));
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