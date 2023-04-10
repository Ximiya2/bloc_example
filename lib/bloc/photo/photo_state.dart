import 'package:equatable/equatable.dart';

import '../../models/photosModel.dart';

abstract class PhotoState extends Equatable {

  @override
  List<Object> get props => [];
}

class PhotoInit extends PhotoState{}

class PhotoLoading extends PhotoState{}

class PhotoLoaded extends PhotoState{

  final List<PhotosModel>? posts;
  bool? isPhoto;

  PhotoLoaded({this.posts, this.isPhoto});
}

class PhotoError extends PhotoState {
  final error;

  PhotoError({this.error});
}