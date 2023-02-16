import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/home/cubit/me_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

class MeScreen extends StatelessWidget {
  const MeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fLocate = GlobalVariables.getIt<FLocate>();
    return BlocProvider(
      create: (context) => MeCubit()..initCubit(),
      child: Column(
        children: [
          Container(
            color: AppColors.white,
            padding: const EdgeInsets.only(
              left: FPaddingSizes.s20,
              right: FPaddingSizes.s20,
              bottom: FPaddingSizes.s20,
              top: FPaddingSizes.s50,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  fLocate.str(FLocalKey.me),
                  style: AppTextStyles.headline6
                      .copyWith(color: AppColors.colorTextColor),
                ),
                Stack(
                  alignment: Alignment.topRight,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: const Icon(
                            CommunityMaterialIcons.bell_ring_outline)),
                    Container(
                      width: 15,
                      height: 15,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: AppColors.red),
                      alignment: Alignment.center,
                      child: Text(
                        '4',
                        style: AppTextStyles.body2
                            .copyWith(color: AppColors.white, fontSize: 10),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.only(
                        left: FPaddingSizes.s20,
                        right: FPaddingSizes.s20,
                        bottom: FPaddingSizes.s50,
                        top: FPaddingSizes.s20),
                    decoration: const BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Container(
                                height: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: AppColors.grey),
                                child: Image.asset(AppAssets.defaultAvatar)),
                            FSizeBoxs.w20,
                            Expanded(
                              child: BlocBuilder<MeCubit, MeState>(
                                builder: (context, state) {
                                  return Text(
                                    state.nickname,
                                    style: AppTextStyles.headline6.copyWith(
                                        color: AppColors.colorTextColor),
                                  );
                                },
                              ),
                            ),
                            const Icon(CommunityMaterialIcons.chevron_right),
                          ],
                        ),
                      ],
                    ),
                  ),
                  FSizeBoxs.h20,
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: FPaddingSizes.s20,
                        vertical: FPaddingSizes.s20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(FPaddingSizes.s20),
                        color: AppColors.white),
                    child: Column(children: [
                      iconWithTextWidget(
                        iconData: AppIcons.iconBook,
                        iconColor: AppColors.colorPrimary,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.vocabBooks),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconSearchOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.help),
                      ),
                      iconWithTextWidget(
                        iconData: CommunityMaterialIcons.translate,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.language),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconChatOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.contactUs),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconUserOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.aboutMatPractice),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconShareOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.shareApp),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconLikeOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.rateOurApp),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconLockOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.privacyPolicy),
                      ),
                      iconWithTextWidget(
                        iconData: AppIcons.iconBookOutline,
                        onTap: () {},
                        title: fLocate.str(FLocalKey.termsOfUse),
                      ),
                    ]),
                  ),
                  FSizeBoxs.h20,
                  BlocBuilder<MeCubit, MeState>(
                    builder: (context, state) {
                      return InkWell(
                        onTap: () =>
                            context.read<MeCubit>().signOutOnClick(context),
                        child: Container(
                          width: double.infinity,
                          padding: const EdgeInsets.all(20),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: AppColors.white),
                          child: Text(
                            fLocate.str(FLocalKey.logOut),
                            style: AppTextStyles.body1
                                .copyWith(color: AppColors.red),
                          ),
                        ),
                      );
                    },
                  ),
                  FSizeBoxs.h20,
                  Text(
                    fLocate.str(FLocalKey.nameVersion),
                    style: AppTextStyles.body1.copyWith(color: AppColors.grey),
                  ),
                  FSizeBoxs.h50,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget iconWithTextWidget(
      {String? iconUrl,
      IconData? iconData,
      required String title,
      Color? iconColor,
      required Function() onTap}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: FPaddingSizes.s20),
      child: Row(
        children: [
          SizedBox(
              width: 30,
              height: 30,
              child: iconUrl == null
                  ? Icon(
                      iconData,
                      color: iconColor,
                    )
                  : Image.asset(iconUrl, color: iconColor)),
          FSizeBoxs.w20,
          Text(
            title,
            style: AppTextStyles.body1,
          ),
          const Spacer(),
          const Icon(CommunityMaterialIcons.chevron_right),
        ],
      ),
    );
  }
}
