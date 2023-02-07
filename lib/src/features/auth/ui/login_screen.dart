import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/ma_locate.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/features/auth/cubit/login_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/ma_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/ma_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/mat.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maLocate = GlobalVariables.getIt<MaLocate>();
    final matWidgets = GlobalVariables.getIt<MatApp>();

    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        // backgroundColor: AppColors.whiteGrey,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(maLocate.str(MaLocalKey.login)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: MaPaddingSizes.s50, vertical: 20),
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
                MaSizeBoxs.h20,
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        matWidgets.textField(
                            onChanged:
                                context.read<LoginCubit>().emailOnChanged,
                            hintText: maLocate.str(MaLocalKey.email),
                            controller:
                                context.read<LoginCubit>().emailController),
                        MaSizeBoxs.h10,
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
                MaSizeBoxs.h20,
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
                            hintText: maLocate.str(MaLocalKey.hintPassword),
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
                MaSizeBoxs.h20,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: matWidgets.outlineButton(
                          onClick: () {
                            context.pushNamed(AppPaths.register);
                          },
                          title: maLocate.str(MaLocalKey.register)),
                    ),
                    MaSizeBoxs.w20,
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
                              title: maLocate.str(MaLocalKey.login));
                        },
                      ),
                    ),
                  ],
                ),
                MaSizeBoxs.h100,
                BlocBuilder<LoginCubit, LoginState>(
                  builder: (cubitContext, state) {
                    return matWidgets.outlineButton(
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: MaPaddingSizes.s10),
                        child: Icon(CommunityMaterialIcons.google),
                      ),
                      backgroundColor: AppColors.white,
                      onClick: cubitContext
                          .read<LoginCubit>()
                          .loginWithGoogleOnClick,
                      title: maLocate.str(MaLocalKey.signInWithGoogle),
                    );
                  },
                ),
                Text(
                  maLocate.str(MaLocalKey.forgotPassword),
                  style: AppTextStyles.body2.copyWith(
                      color: AppColors.grey,
                      decoration: TextDecoration.underline),
                ),
                MaSizeBoxs.h20,
              ],
            ),
          ),
        )),
      ),
    );
  }
}
