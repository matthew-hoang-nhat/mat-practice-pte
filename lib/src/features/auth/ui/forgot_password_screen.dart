import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/auth/cubit/forgot_password_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final fWidgets = GlobalVariables.getIt<FApp>();
    final fLocate = GlobalVariables.getIt<FLocate>();
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          title: Text(fLocate.str(FLocalKey.forgotPassword)),
          elevation: 0,
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(FPaddingSizes.s20),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fLocate.str(FLocalKey.email),
                    style: AppTextStyles.body2
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  FSizeBoxs.h20,
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          fWidgets.textField(
                              hintText: fLocate.str(FLocalKey.email),
                              onChanged: context
                                  .read<ForgotPasswordCubit>()
                                  .emailPasswordOnChanged,
                              controller: context
                                  .read<ForgotPasswordCubit>()
                                  .emailController),
                          Text(
                            state.notificationEmail,
                            style: AppTextStyles.body2
                                .copyWith(color: AppColors.red),
                          ),
                        ],
                      );
                    },
                  ),
                  FSizeBoxs.h20,
                  BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                    builder: (context, state) {
                      return SizedBox(
                        width: 200,
                        child: fWidgets.button(
                            onClick: context
                                .read<ForgotPasswordCubit>()
                                .sendEmailOnClick,
                            title: fLocate.str(FLocalKey.sendToEmail)),
                      );
                    },
                  )
                ],
              ),
              BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                buildWhen: (previous, current) =>
                    previous.isLoading != current.isLoading,
                builder: (context, state) {
                  if (state.isLoading) return const LoadingWidget();
                  return Container();
                },
              )
            ],
          ),
        )),
      ),
    );
  }
}
