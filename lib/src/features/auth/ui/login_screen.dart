import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';

import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/auth/cubit/login_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maLocate = GlobalVariables.getIt<FLocate>();
    final matWidgets = GlobalVariables.getIt<FApp>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        // backgroundColor: AppColors.whiteGrey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(maLocate.str(FLocalKey.login)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: FPaddingSizes.s50, vertical: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      border: Border.all(width: 3, color: AppColors.grey),
                      borderRadius: BorderRadius.circular(100),
                      color: AppColors.white),
                  child: Image.asset(
                    'assets/icon_monkey.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                FSizeBoxs.h20,
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        matWidgets.textField(
                            onChanged:
                                context.read<LoginCubit>().emailOnChanged,
                            hintText: maLocate.str(FLocalKey.email),
                            controller:
                                context.read<LoginCubit>().emailController),
                        FSizeBoxs.h10,
                        BlocBuilder<LoginCubit, LoginState>(
                          buildWhen: (previous, current) =>
                              previous.notificationEmail !=
                              current.notificationEmail,
                          builder: (context, state) {
                            if (state.notificationEmail == '') {
                              return Container();
                            }
                            return Text(
                              state.notificationEmail,
                              style: AppTextStyles.body2
                                  .copyWith(color: AppColors.red),
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
                FSizeBoxs.h20,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) => false,
                      builder: (context, state) {
                        return matWidgets.textField(
                            isObscureText: true,
                            onChanged:
                                context.read<LoginCubit>().passwordOnChanged,
                            hintText: maLocate.str(FLocalKey.hintPassword),
                            controller:
                                context.read<LoginCubit>().passwordController);
                      },
                    ),
                    BlocBuilder<LoginCubit, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.notificationPassword !=
                          current.notificationPassword,
                      builder: (context, state) {
                        if (state.notificationPassword == '') {
                          return Container();
                        }
                        return Text(
                          state.notificationPassword,
                          style: AppTextStyles.body2
                              .copyWith(color: AppColors.red),
                        );
                      },
                    )
                  ],
                ),
                FSizeBoxs.h20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: matWidgets.outlineButton(
                          onClick: () {
                            FCoordinator.showRegisterScreen();
                          },
                          title: maLocate.str(FLocalKey.register)),
                    ),
                    FSizeBoxs.w20,
                    Expanded(
                      child: BlocBuilder<LoginCubit, LoginState>(
                        buildWhen: (previous, current) =>
                            previous.isLoading != current.isLoading,
                        builder: (cubitContext, state) {
                          return matWidgets.button(
                              suffixIcon: state.isLoading == true
                                  ? Container(
                                      height: 20,
                                      width: 20,
                                      margin: const EdgeInsets.symmetric(
                                          horizontal: 20),
                                      child: const CircularProgressIndicator(
                                        color: AppColors.white,
                                      ))
                                  : null,
                              onClick: () => cubitContext
                                  .read<LoginCubit>()
                                  .loginWithEmailPasswordOnClick(context),
                              title: maLocate.str(FLocalKey.login));
                        },
                      ),
                    ),
                  ],
                ),
                FSizeBoxs.h100,
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (cubitContext, state) {
                    return matWidgets.outlineButton(
                      prefixIcon: const Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: FPaddingSizes.s10),
                        child: Icon(CommunityMaterialIcons.google),
                      ),
                      backgroundColor: AppColors.white,
                      onClick: cubitContext
                          .read<LoginCubit>()
                          .loginWithGoogleOnClick,
                      title: maLocate.str(FLocalKey.signInWithGoogle),
                    );
                  },
                ),
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return InkWell(
                      onTap: () => context
                          .read<LoginCubit>()
                          .forgotPasswordOnClick(context),
                      child: Text(
                        maLocate.str(FLocalKey.forgotPassword),
                        style: AppTextStyles.body2.copyWith(
                            color: AppColors.grey,
                            decoration: TextDecoration.underline),
                      ),
                    );
                  },
                ),
                FSizeBoxs.h20,
              ],
            ),
          ),
        )),
      ),
    );
  }
}
