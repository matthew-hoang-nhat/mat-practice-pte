import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/features/lesson/widgets/audio/cubit/audio_cubit.dart';
import 'package:mat_practice_pte/src/utils/helpers/helpers.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';

import '../enum/audio_speeds.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        vertical: FPaddingSizes.s20,
      ),
      decoration: const BoxDecoration(
          // borderRadius: BorderRadius.circular(10),
          // color: AppColors.white,
          // border: Border.all(color: AppColors.grey),
          ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              BlocBuilder<AudioCubit, AudioState>(
                buildWhen: (previous, current) =>
                    previous.isPlay != current.isPlay,
                builder: (context, state) {
                  return InkWell(
                      onTap: context.read<AudioCubit>().onClick,
                      child: Icon(
                        state.isPlay
                            ? AppIcons.iconPauseCircleOutline
                            : AppIcons.iconPlayCircleOutline,
                        color: AppColors.colorPrimary,
                        size: 50,
                      ));
                },
              ),
              BlocBuilder<AudioCubit, AudioState>(
                buildWhen: (previous, current) =>
                    previous.duration != current.duration,
                builder: (context, state) {
                  return Expanded(
                    child: StreamBuilder<Duration>(
                      stream: context.read<AudioCubit>().positionStream,
                      builder: (streamContext, snapshot) {
                        final position =
                            snapshot.data?.inSeconds.toDouble() ?? 0;
                        final duration = state.duration.inSeconds.toDouble();
                        double value = position.clamp(0, duration);
                        return Slider.adaptive(
                          min: 0,
                          max: duration,
                          value: value,
                          onChanged: streamContext.read<AudioCubit>().seek,
                          activeColor: AppColors.colorPrimary,
                        );
                      },
                    ),
                  );
                },
              ),
              StreamBuilder<Duration?>(
                  stream: context.read<AudioCubit>().positionStream,
                  builder: (context, snapshot) {
                    final position = snapshot.data;
                    if (position == null) return Container();
                    return Text(Helpers.formatTime(position),
                        style: AppTextStyles.body1
                            .copyWith(color: AppColors.grey));
                  }),
              FSizeBoxs.w10,
              BlocBuilder<AudioCubit, AudioState>(
                buildWhen: (previous, current) =>
                    previous.speed != current.speed,
                builder: (context, state) {
                  return Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(color: AppColors.grey)),
                    child: DropdownButton<double>(
                      isDense: true,
                      underline: Container(),
                      value: state.speed,
                      items: List.generate(
                          audioSpeeds.length,
                          (index) => DropdownMenuItem(
                              value: audioSpeeds.elementAt(index),
                              child: Text('${audioSpeeds.elementAt(index)}X',
                                  style: AppTextStyles.labelMedium.copyWith(
                                      color:
                                          AppColors.colorPrimary)))).toList(),
                      icon: const Visibility(
                          visible: false, child: Icon(Icons.arrow_downward)),
                      onChanged: context.read<AudioCubit>().onChangeSpeed,
                    ),
                  );
                },
              )
            ],
          ),
        ],
      ),
    );
  }
}
