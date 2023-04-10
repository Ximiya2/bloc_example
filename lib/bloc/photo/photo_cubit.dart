import 'package:bloc/bloc.dart';
import 'package:bloc_example/bloc/photo/photo_state.dart';
import 'package:bloc_example/bloc/post/post_state.dart';
import 'package:bloc_example/models/postModel.dart';
import 'package:bloc_example/service/photo_service.dart';
import 'package:bloc_example/service/post_service.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class PhotoCubit extends Cubit<PhotoState> {
  PhotoCubit() : super(PhotoInit());

  void getPhoto() async {
    emit(PhotoLoading());
    final response = await GetPhotoService.getPhoto();

    response.fold((l) {
      emit(PhotoError(error: l));
     EasyLoading.showError(l);
    }, (r) {
      emit(PhotoLoaded(posts: r));
    });
  }
  //
  // void deletePhoto(int id) async {
  //   emit(PhotoLoading());
  //   final response = await GetPhotoService.deletePhoto(id);
  //
  //   response.fold((l) {
  //     //EasyLoading.showError(l);
  //     emit(PhotoError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully deleted');
  //     getPhoto();
  //   });
  // }
  //
  // void editPhoto(PhotoModel newPhoto) async {
  //   emit(PhotoLoading());
  //   final response = await GetPhotoService.editPhoto(newPhoto);
  //
  //   response.fold((l) {
  //     EasyLoading.showError(l);
  //     emit(PhotoError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully edited');
  //     emit(PhotoLoaded(isPhoto: r));
  //   });
  // }
  //
  // void addPhoto(PhotoModel newPhoto) async {
  //   emit(PhotoLoading());
  //   final response = await GetPhotoService.addPhoto(newPhoto);
  //
  //   response.fold((l) {
  //     EasyLoading.showError(l);
  //     emit(PhotoError(error: l));
  //   }, (r) {
  //     EasyLoading.showSuccess('Successfully add');
  //     emit(PhotoLoaded(isPhoto: r));
  //   });
  // }
}