// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    required this.isLoading,
    required this.notificationEmail,
  });
  factory ForgotPasswordState.init() =>
      const ForgotPasswordState(isLoading: false, notificationEmail: '');
  final bool isLoading;
  final String notificationEmail;
  @override
  List<Object> get props => [isLoading, notificationEmail];

  ForgotPasswordState copyWith({
    bool? isLoading,
    String? notificationEmail,
  }) {
    return ForgotPasswordState(
      isLoading: isLoading ?? this.isLoading,
      notificationEmail: notificationEmail ?? this.notificationEmail,
    );
  }
}
