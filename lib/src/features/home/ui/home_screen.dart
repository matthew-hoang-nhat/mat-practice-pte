import 'package:community_material_icon/community_material_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';
import 'package:mat_practice_pte/src/features/home/cubit/home_cubit.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

enum _HomeWidgetType {
  studyTool,
  guide,
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fLocate = GlobalVariables.getIt<FLocate>();
    final fWidgets = GlobalVariables.getIt<FApp>();
    final whiteTextBodyStyle =
        AppTextStyles.body2.copyWith(color: AppColors.white);
    final whiteTextHeading6Style =
        AppTextStyles.headline6.copyWith(color: AppColors.white);

    return BlocProvider(
      create: (context) => HomeCubit()..initCubit(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              topContainerWidget(
                  fLocate, whiteTextHeading6Style, whiteTextBodyStyle),
              waveComponent(),
              FSizeBoxs.h20,
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: FPaddingSizes.s20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    fWidgets.textField(
                        borderRadius: 100,
                        hintText: fLocate.str(FLocalKey.hintSearch),
                        controller: TextEditingController(),
                        onChanged: (value) {}),
                    FSizeBoxs.h50,
                    Text(fLocate.str(FLocalKey.practice),
                        style: AppTextStyles.headline5
                            .copyWith(color: AppColors.colorTextColor)),
                    FSizeBoxs.h10,
                    practiceComponent(fLocate),
                    FSizeBoxs.h20,
                    Text(fLocate.str(FLocalKey.studyTools),
                        style: AppTextStyles.headline5
                            .copyWith(color: AppColors.colorTextColor)),
                    FSizeBoxs.h10,
                    Row(
                      children: [
                        _iconWithTextWidget(
                          iconData: AppIcons.iconBook,
                          onTap: () {},
                          text: fLocate.str(FLocalKey.vocab),
                          type: _HomeWidgetType.studyTool,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
              FSizeBoxs.h10,
              splashComponent(),
              FSizeBoxs.h10,
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: FPaddingSizes.s20),
                  child: guideComponent(context)),
              const Divider(),
              FSizeBoxs.h70,
            ],
          ),
        ),
      ),
    );
  }

  Widget waveComponent() {
    const backgroundColor = AppColors.colorPrimary;

    final colors = [
      AppColors.colorPrimary,
      // AppColors.colorPrimary,
      AppColors.grey.withOpacity(0.7),
    ];

    final durations = [
      5000,
      4000,
    ];

    const heightPercentages = [
      0.7,
      0.3,
    ];
    return SizedBox(
      height: 10,
      child: WaveWidget(
        config: CustomConfig(
          colors: colors,
          durations: durations,
          heightPercentages: heightPercentages,
        ),
        backgroundColor: backgroundColor,
        size: const Size(double.infinity, double.infinity),
        waveAmplitude: 2,
      ),
    );
  }

  Widget practiceComponent(FLocate fLocate) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (cubitContext, state) {
        return Row(
          children: [
            itemPracticeWidget(
              backgroundColor: AppColors.red,
              hint: fLocate.str(FLocalKey.hintReading),
              title: fLocate.str(FLocalKey.reading),
              iconData: AppIcons.iconBookOutline,
              onTap: cubitContext.read<HomeCubit>().readingOnClick,
            ),
            FSizeBoxs.w20,
            itemPracticeWidget(
              backgroundColor: AppColors.green,
              hint: fLocate.str(FLocalKey.hintListening),
              title: fLocate.str(FLocalKey.listening),
              iconData: AppIcons.iconHeadphoneOutline,
              onTap: cubitContext.read<HomeCubit>().listeningOnCLick,
            ),
          ],
        );
      },
    );
  }

  Widget guideComponent(context) {
    final fLocate = GlobalVariables.getIt<FLocate>();
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (cubitContext, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              fLocate.str(FLocalKey.guide),
              style: AppTextStyles.headline5
                  .copyWith(color: AppColors.colorTextColor),
            ),
            FSizeBoxs.h10,
            Row(
              children: [
                _iconWithTextWidget(
                  text: fLocate.str(FLocalKey.appName),
                  onTap: () {},
                  iconUrl: AppAssets.defaultAvatar,
                  type: _HomeWidgetType.guide,
                ),
                _iconWithTextWidget(
                  text: fLocate.str(FLocalKey.reading),
                  onTap: cubitContext.read<HomeCubit>().readingOnClick,
                  iconData: AppIcons.iconBookOutline,
                  type: _HomeWidgetType.guide,
                ),
                _iconWithTextWidget(
                  text: fLocate.str(FLocalKey.listening),
                  onTap: cubitContext.read<HomeCubit>().listeningOnCLick,
                  iconData: AppIcons.iconHeadphoneOutline,
                  type: _HomeWidgetType.guide,
                ),
              ],
            )
          ],
        );
      },
    );
  }

  Widget itemSplashWidget({required String assetUrl}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: FPaddingSizes.s10),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.asset(
            assetUrl,
            fit: BoxFit.cover,
          )),
    );
  }

  Widget splashComponent() {
    return BlocBuilder<HomeCubit, HomeState>(
      buildWhen: (previous, current) =>
          previous.currentIndexSplash != current.currentIndexSplash,
      builder: (context, state) {
        return Stack(
          alignment: Alignment.bottomCenter,
          children: [
            SizedBox(
              height: 100,
              child: PageView(
                  onPageChanged: context.read<HomeCubit>().pageViewOnChanged,
                  controller: context.read<HomeCubit>().pageViewController,
                  children: [
                    itemSplashWidget(assetUrl: AppAssets.imgHomeSplash1),
                    itemSplashWidget(assetUrl: AppAssets.imgHomeSplash2),
                    itemSplashWidget(assetUrl: AppAssets.imgHomeSplash3),
                  ]),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (index) {
                return Container(
                  height: 10,
                  width: 10,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: state.currentIndexSplash == index
                        ? AppColors.colorPrimary
                        : AppColors.white,
                  ),
                );
              }),
            )
          ],
        );
      },
    );
  }

  Widget _iconWithTextWidget({
    required String text,
    required Function() onTap,
    String? iconUrl,
    IconData? iconData,
    required _HomeWidgetType type,
  }) {
    Color backgroundColor = AppColors.grey.withOpacity(0.3);
    Color iconColor = AppColors.red;

    switch (type) {
      case _HomeWidgetType.studyTool:
        break;
      case _HomeWidgetType.guide:
        backgroundColor = AppColors.colorPrimary;
        iconColor = AppColors.white;
        break;
      default:
    }

    return Padding(
      padding: const EdgeInsets.only(right: FPaddingSizes.s20),
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: backgroundColor),
                  child: iconUrl == null
                      ? Icon(
                          iconData,
                          size: 30,
                          color: iconColor,
                        )
                      : Image.asset(
                          iconUrl,
                          width: 30,
                          height: 30,
                          color: iconColor,
                        ),
                ),
                Text(
                  text,
                  style: AppTextStyles.body1,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget itemPracticeWidget(
          {required String title,
          required String hint,
          required Color backgroundColor,
          required IconData iconData,
          required Function() onTap}) =>
      Flexible(
        child: InkWell(
          onTap: onTap,
          child: Container(
            // margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.symmetric(
                horizontal: FPaddingSizes.s10, vertical: FPaddingSizes.s20),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: backgroundColor,
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    backgroundColor,
                    backgroundColor,
                    AppColors.grey,
                  ],
                )),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style:
                      AppTextStyles.headline6.copyWith(color: AppColors.white),
                ),
                const Divider(color: AppColors.white),
                SizedBox(
                  height: 40,
                  child: Text(
                    hint,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body2.copyWith(color: AppColors.white),
                  ),
                ),
                FSizeBoxs.h10,
                Icon(
                  iconData,
                  color: AppColors.white,
                  size: 50,
                ),
              ],
            ),
          ),
        ),
      );

  Widget topContainerWidget(
    FLocate fLocate,
    TextStyle whiteTextHeading6Style,
    TextStyle whiteTextBodyStyle,
  ) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final totalPracticed = state.user?.userPractice?.totalPracticed ?? 0;
        final todayPracticed = state.user?.userPractice?.todayPracticed ?? 0;
        final pracDays = state.user?.userPractice?.pracDays ?? 0;

        return Container(
          padding: const EdgeInsets.only(
              bottom: FPaddingSizes.s20,
              top: FPaddingSizes.s50,
              left: FPaddingSizes.s10,
              right: FPaddingSizes.s10),
          color: AppColors.colorPrimary,
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Container(
                          color: AppColors.red,
                          child: Image.asset(AppAssets.defaultAvatar,
                              width: 50, height: 50))),
                  const Spacer(),
                  Text(
                    state.user?.nickname ?? '',
                    style: whiteTextHeading6Style,
                  ),
                  const Icon(CommunityMaterialIcons.chevron_right,
                      color: AppColors.white),
                ],
              ),
              FSizeBoxs.h50,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(fLocate.str(FLocalKey.todayPracticed),
                            style: whiteTextBodyStyle),
                        Text(todayPracticed.toString(),
                            style: AppTextStyles.headline4
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    color: AppColors.grey,
                    width: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(fLocate.str(FLocalKey.totalPracticed),
                            style: AppTextStyles.body2
                                .copyWith(color: AppColors.white)),
                        Text(totalPracticed.toString(),
                            style: AppTextStyles.headline4
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                  Container(
                    height: 40,
                    color: AppColors.grey,
                    width: 1,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Text(fLocate.str(FLocalKey.pracDays),
                            style: AppTextStyles.body2
                                .copyWith(color: AppColors.white)),
                        Text(pracDays.toString(),
                            style: AppTextStyles.headline4
                                .copyWith(color: AppColors.white)),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
