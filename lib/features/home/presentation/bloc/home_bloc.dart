import 'package:flutter_bloc/flutter_bloc.dart';
import 'home_event.dart';
import 'home_state.dart';
import '../../repository/home_repository.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final HomeRepository repository;

  UserBloc({required this.repository}) : super(const UserState()) {
    on<UserFetchRequested>(_onFetchRequested);
    on<UserRefreshRequested>(_onRefreshRequested);
  }

  Future<void> _onFetchRequested(
    UserFetchRequested event,
    Emitter<UserState> emit,
  ) async {
    emit(state.copyWith(status: UserStatus.loading));
    try {
      final users = await repository.fetchUsers();
      emit(state.copyWith(status: UserStatus.success, users: users));
    } catch (_) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: 'Unable to fetch users. Pull to refresh.',
      ));
    }
  }

  Future<void> _onRefreshRequested(
    UserRefreshRequested event,
    Emitter<UserState> emit,
  ) async {
    try {
      final users = await repository.fetchUsers();
      emit(state.copyWith(status: UserStatus.success, users: users));
    } catch (_) {
      emit(state.copyWith(
        status: UserStatus.failure,
        message: 'Unable to refresh users. Try again later.',
      ));
    }
  }
}
