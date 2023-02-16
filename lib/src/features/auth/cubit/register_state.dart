// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_cubit.dart';

class RegisterState extends Equatable {
  const RegisterState({
    required this.password,
    required this.isLiked,
    required this.isAccepted,
    required this.email,
    required this.username,
    required this.isLoading,
    required this.notificationNickname,
    required this.notificationEmail,
    required this.notificationPassword,
  });

  factory RegisterState.init() => const RegisterState(
        password: '',
        notificationEmail: '',
        notificationPassword: '',
        notificationNickname: '',
        email: '',
        username: '',
        isLiked: false,
        isAccepted: false,
        isLoading: false,
      );
  final String password;
  final String email;
  final String username;
  final String notificationNickname;
  final String notificationEmail;
  final String notificationPassword;
  final bool isLiked;
  final bool isLoading;
  final bool isAccepted;
  @override
  List<Object> get props => [
        password,
        isLiked,
        isAccepted,
        email,
        username,
        notificationEmail,
        notificationNickname,
        notificationPassword,
        isLoading
      ];

  RegisterState copyWith({
    String? password,
    String? email,
    String? username,
    String? notificationNickname,
    String? notificationEmail,
    String? notificationPassword,
    bool? isLiked,
    bool? isLoading,
    bool? isAccepted,
  }) {
    return RegisterState(
      password: password ?? this.password,
      email: email ?? this.email,
      username: username ?? this.username,
      notificationNickname: notificationNickname ?? this.notificationNickname,
      notificationEmail: notificationEmail ?? this.notificationEmail,
      notificationPassword: notificationPassword ?? this.notificationPassword,
      isLiked: isLiked ?? this.isLiked,
      isAccepted: isAccepted ?? this.isAccepted,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
