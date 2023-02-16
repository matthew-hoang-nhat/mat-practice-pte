// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_cubit.dart';

class LoginState extends Equatable {
  const LoginState({
    required this.isLiked,
    required this.isAccepted,
    required this.isLoading,
    required this.notificationEmail,
    required this.notificationPassword,
  });
  factory LoginState.init() => const LoginState(
        isLiked: false,
        isAccepted: false,
        isLoading: false,
        notificationEmail: '',
        notificationPassword: '',
      );

  final String notificationEmail;
  final String notificationPassword;

  final bool isLiked;
  final bool isAccepted;
  final bool isLoading;
  @override
  List<Object> get props => [
        isLiked,
        isAccepted,
        isLoading,
        notificationEmail,
        notificationPassword,
      ];

  LoginState copyWith({
    String? notificationPassword,
    String? notificationEmail,
    bool? isLiked,
    bool? isLoading,
    bool? isAccepted,
  }) {
    return LoginState(
      isLiked: isLiked ?? this.isLiked,
      isAccepted: isAccepted ?? this.isAccepted,
      notificationEmail: notificationEmail ?? this.notificationEmail,
      notificationPassword: notificationPassword ?? this.notificationPassword,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
