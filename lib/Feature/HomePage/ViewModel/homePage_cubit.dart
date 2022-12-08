import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_serializable_flutter/Future/HomePage/Model/person_model.dart';
import 'package:json_serializable_flutter/Future/HomePage/Services/IUserService.dart';

class UserCubit extends Cubit<UserState> {
  final IUserSercice userService;
  UserCubit(this.userService) : super(UserInitialState()) {
    size = 25;
    fetchUser();
  }
  late int size;

  Future<void> fetchUser() async {
    emit(UserLoadingState());
    final result = await userService.getPerson(size: size);
    if (result != null) {
      emit(UserCompletedState(result));
    } else {
      UserErrorState();
    }
  }
}

abstract class UserState {}

class UserInitialState extends UserState {}

class UserLoadingState extends UserState {}

class UserErrorState extends UserState {}

class UserCompletedState extends UserState {
  final List<Person> model;

  UserCompletedState(this.model);
}
