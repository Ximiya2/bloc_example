import 'package:bloc/bloc.dart';

class MainViewCubit extends Cubit<int> {
  MainViewCubit() : super(0);

  void upDateTab(int index) => emit(index);
}