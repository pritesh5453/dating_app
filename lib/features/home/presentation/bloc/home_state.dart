import 'package:equatable/equatable.dart';
import '../../model/home_model.dart';

enum UserStatus { initial, loading, success, failure }

class UserState extends Equatable {
  final UserStatus status;
  final List<HomeModel> users;
  final String message;

  const UserState({
    this.status = UserStatus.initial,
    this.users = const [],
    this.message = '',
  });

  UserState copyWith({
    UserStatus? status,
    List<HomeModel>? users,
    String? message,
  }) {
    return UserState(
      status: status ?? this.status,
      users: users ?? this.users,
      message: message ?? this.message,
    );
  }

  @override
  List<Object?> get props => [status, users, message];
}
