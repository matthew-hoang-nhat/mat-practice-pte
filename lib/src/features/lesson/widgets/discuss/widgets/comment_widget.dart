// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_assets.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/configs/locate/f_local_key.dart';
import 'package:mat_practice_pte/src/configs/locate/f_locate.dart';

import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_discuss.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

import '../cubit/comment_cubit.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({
    Key? key,
    required this.discuss,
  }) : super(key: key);
  final LessonDiscuss discuss;
  @override
  Widget build(BuildContext context) {
    const sizeIcon = 20.0;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.grey),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: discuss.avatar == null
                  ? Image.asset(
                      AppAssets.defaultAvatar,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : CachedNetworkImage(
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      imageUrl: discuss.avatar!),
            ),
          ),
          //  Image.asset(AppAssets.iconLogo, height: 50, width: 50)),
          FSizeBoxs.w20,
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                        discuss.username ??
                            GlobalVariables.getIt<FLocate>()
                                .str(FLocalKey.unknown),
                        style: AppTextStyles.body1
                            .copyWith(fontWeight: FontWeight.bold)),
                    const Spacer(),
                    if (discuss.uid == context.read<CommentCubit>().uid)
                      InkWell(
                        onTap: () => context
                            .read<CommentCubit>()
                            .removeHistoryLessonOnClick(context, discuss.id!),
                        child: const Icon(AppIcons.iconDeleteOutline,
                            color: AppColors.grey, size: sizeIcon),
                      ),
                    FSizeBoxs.w20,
                    InkWell(
                      onTap: () =>
                          context.read<CommentCubit>().reactOnTap(discuss.id!),
                      child: discuss.reactions.indexWhere((e) =>
                                  e.uid == context.read<CommentCubit>().uid) !=
                              -1
                          ? const Icon(AppIcons.iconLike,
                              color: AppColors.grey, size: sizeIcon)
                          : const Icon(AppIcons.iconLikeOutline,
                              color: AppColors.grey, size: sizeIcon),
                    ),
                  ],
                ),
                FSizeBoxs.h10,
                Text(
                  discuss.content,
                  style: AppTextStyles.body1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
