import 'package:equatable/equatable.dart';
import '../../models/usersModel.dart';

abstract class UserState extends Equatable {

  @override
  List<Object> get props => [];
}

class UserInit extends UserState{}

class UserLoading extends UserState{}

class UserLoaded extends UserState{

  final List<UsersModel>? users;
  bool? isUser;

  UserLoaded({this.users, this.isUser});
}

class UserError extends UserState {
  final error;

  UserError({this.error});
}