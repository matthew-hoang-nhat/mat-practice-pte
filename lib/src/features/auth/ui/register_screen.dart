import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';

import 'package:mat_practice_pte/src/features/auth/cubit/register_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final maLocate = GlobalVariables.getIt<FLocate>();
    final matWidgets = GlobalVariables.getIt<FApp>();

    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(maLocate.str(FLocalKey.register)),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: FPaddingSizes.s50),
                child: Column(
                  children: [
                    FSizeBoxs.h20,
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BlocBuilder<RegisterCubit, RegisterState>(
                          builder: (context, state) {
                            return matWidgets.textField(
                                onChanged: context
                                    .read<RegisterCubit>()
                                    .nicknameOnChanged,
                                hintText: maLocate.str(FLocalKey.hintNickName),
                                controller: context
                                    .read<RegisterCubit>()
                                    .nicknameController);
                          },
                        ),
                        FSizeBoxs.h10,
                        BlocBuilder<RegisterCubit, RegisterState>(
                          buildWhen: (previous, current) =>
                              previous.notificationNickname !=
                              current.notificationNickname,
                          builder: (context, state) {
                            if (state.notificationNickname == '') {
                              return Container();
                            }
                            return Text(
                              state.notificationNickname,
                              style: AppTextStyles.body2
                                  .copyWith(color: AppColors.red),
                            );
                          },
                        )
                      ],
                    ),
                    FSizeBoxs.h20,
                    BlocBuilder<RegisterCubit, RegisterState>(
                      builder: (context, state) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            matWidgets.textField(
                                onChanged: context
                                    .read<RegisterCubit>()
                                    .emailOnChanged,
                                hintText: maLocate.str(FLocalKey.email),
                                controller: context
                                    .read<RegisterCubit>()
                                    .emailController),
                            FSizeBoxs.h10,
                            BlocBuilder<RegisterCubit, RegisterState>(
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
                        BlocBuilder<RegisterCubit, RegisterState>(
                          buildWhen: (previous, current) => false,
                          builder: (context, state) {
                            return matWidgets.textField(
                                isObscureText: true,
                                onChanged: context
                                    .read<RegisterCubit>()
                                    .paswordOnChanged,
                                hintText: maLocate.str(FLocalKey.hintPassword),
                                controller: context
                                    .read<RegisterCubit>()
                                    .passwordController);
                          },
                        ),
                        BlocBuilder<RegisterCubit, RegisterState>(
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
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: FPaddingSizes.s50),
                child: Row(
                  children: [
                    Expanded(
                      child: BlocBuilder<RegisterCubit, RegisterState>(
                        buildWhen: (previous, current) =>
                            previous.isLoading != current.isLoading,
                        builder: (cubitContext, state) {
                          // if (state.isLoading) {
                          //   return matWidgets.outlineButton(
                          //       suffixIcon: Container(
                          //           height: 20,
                          //           width: 20,
                          //           margin: const EdgeInsets.symmetric(
                          //               horizontal: 20),
                          //           child: const CircularProgressIndicator(
                          //             color: AppColors.colorPrimary,
                          //           )),
                          //       onClick: () => cubitContext
                          //           .read<RegisterCubit>()
                          //           .registerButtonOnClick(context),
                          //       title: maLocate.str(FLocalKey.register));
                          // }

                          return matWidgets.button(
                              suffixIcon: state.isLoading
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
                                  .read<RegisterCubit>()
                                  .registerButtonOnClick(context),
                              title: maLocate.str(FLocalKey.register));
                        },
                      ),
                    ),
                  ],
                ),
              ),
              // if (MediaQuery.of(context).viewInsets.bottom == 0)
              //   Padding(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: MaPaddingSizes.s50),
              //     child: Column(
              //       children: [
              //         MaSizeBoxs.h100,
              //         Row(
              //           children: [
              //             BlocBuilder<RegisterCubit, RegisterState>(
              //               buildWhen: (previous, current) =>
              //                   previous.isAccepted != current.isAccepted,
              //               builder: (context, state) {
              //                 return matWidgets.checkbox(
              //                     onChanged: context
              //                         .read<RegisterCubit>()
              //                         .acceptedOnChanged,
              //                     value: state.isAccepted);
              //               },
              //             ),
              //             Flexible(
              //               child: RichText(
              //                 text: TextSpan(
              //                     text: maLocate
              //                         .str(FLocalKey.iVeReadAndAgreedToThe),
              //                     style: AppTextStyles.body2
              //                         .copyWith(color: AppColors.black),
              //                     children: [
              //                       const TextSpan(text: ' '),
              //                       TextSpan(
              //                           text: maLocate.str(FLocalKey.termsOfUse),
              //                           style: AppTextStyles.body2.copyWith(
              //                               color: AppColors.colorPrimary)),
              //                       const TextSpan(text: ' '),
              //                       TextSpan(text: maLocate.str(FLocalKey.and)),
              //                       const TextSpan(text: ' '),
              //                       TextSpan(
              //                           text: maLocate
              //                               .str(FLocalKey.privacyPolicy),
              //                           style: AppTextStyles.body2.copyWith(
              //                               color: AppColors.colorPrimary)),
              //                     ]),
              //               ),
              //             ),
              //           ],
              //         ),
              //         MaSizeBoxs.h20,
              //       ],
              //     ),
              //   ),

              // ElevatedButton(
              //   onPressed: () {},
              //   child: Container(
              //     height: 20,
              //     width: 20,
              //     margin: const EdgeInsets.all(10),
              //     child: const CircularProgressIndicator.adaptive(
              //       backgroundColor: AppColors.colorPrimary,
              //     ),
              //   ),
              //   // child: const CupertinoActivityIndicator(),
              // ),

              FSizeBoxs.h20,
            ],
          ),
        )),
      ),
    );
  }
}
