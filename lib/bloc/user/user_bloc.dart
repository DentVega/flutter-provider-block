import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:providerblock/models/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(const UserInitialState()) {
    on<ActivateUser>((event, emit) {
      ///event.user
      emit(UserSetState(event.user));
    });

    on<DeleteUser>((event, emit) {
      ///event.user
      emit(const UserInitialState());
    });

    on<ChangeUserAge>((event, emit) {
      ///event.age
      if (!state.existUser) return;
      emit(UserSetState(state.user!.copyWith(edad: event.age)));
    });

    on<AddProfession>((event, emit) {
      if (!state.existUser) return;
      final professions = [...state.user!.profesiones, event.newProfession];
      emit(UserSetState(state.user!.copyWith(profesiones: professions)));
    });
  }

  //mapToEventState
}
