import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/constants/app_colors.dart';
import 'package:mat_practice_pte/src/configs/constants/app_icons.dart';
import 'package:mat_practice_pte/src/configs/constants/app_text_styles.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/word/m_word.dart';
import 'package:mat_practice_pte/src/networks/models/word/meaning.dart';
import 'package:mat_practice_pte/src/networks/models/word/phonetic.dart';
import 'package:mat_practice_pte/src/services/audio_manger.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_padding_sizes.dart';
import 'package:mat_practice_pte/src/widgets/dimentions/f_sizeboxs.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';
import 'package:mat_practice_pte/src/widgets/loading_widget.dart';
part '../../../utils/helpers/ext_word_definition.dart';
part 'show_bottom_definition_state.dart';

class ShowBottomDefinitionCubit extends Cubit<ShowBottomDefinitionState> {
  ShowBottomDefinitionCubit() : super(const ShowBottomDefinitionInitial());

  final mat = GlobalVariables.getIt<FApp>();
  final wordRepo = DomainManager.instance.wordRepository;

  Future<void> _fetchDefinition(String word) async {
    emit(state.copyWith(
        definition: Wrapper(null),
        isSaved: Wrapper(null),
        error: Wrapper(null)));
    final result = await wordRepo.getDefinition(word);
    fetchResource(result, onSuccess: () {
      final definition = result.data!;
      emit(state.copyWith(definition: Wrapper(definition)));
    }, onError: () {
      emit(state.copyWith(error: Wrapper('Lỗi mất rồi')));
    });
  }

  setIsSaved(bool value) {
    emit(state.copyWith(isSaved: Wrapper(value)));
  }

  showDefinition(context, {required String text}) async {
    final word = text.filterWord();
    _fetchDefinition(word);
    await mat.showBottomModalSheet(context,
        title: BlocProvider.value(
          value: BlocProvider.of<ShowBottomDefinitionCubit>(context),
          child:
              BlocBuilder<ShowBottomDefinitionCubit, ShowBottomDefinitionState>(
            builder: (context, state) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(word, style: AppTextStyles.headline5),
                  // InkWell(
                  //   onTap: () {
                  //     final isSaved = !(state.isSaved ?? false);
                  //     setIsSaved(isSaved);
                  //   },
                  //   child: Icon(
                  //     state.isSaved == true
                  //         ? AppIcons.iconStar
                  //         : AppIcons.iconStarOutline,
                  //     color: AppColors.colorPrimary,
                  //   ),
                  // )
                ],
              );
            },
          ),
        ),
        widget: BlocProvider.value(
          value: BlocProvider.of<ShowBottomDefinitionCubit>(context),
          child:
              BlocBuilder<ShowBottomDefinitionCubit, ShowBottomDefinitionState>(
            buildWhen: (previous, current) =>
                previous.definition != current.definition ||
                previous.error != current.error,
            builder: (context, state) {
              if (state.error != null) {
                return const Text('Not found this word.');
              }
              if (state.definition == null) return const LoadingWidget();

              final phonetics = state.definition?.phonetics ?? [];
              List<Phonetic> choosePhonetics = [];
              for (Phonetic item in phonetics) {
                if (item.audio != null && item.text != null) {
                  choosePhonetics.add(item);
                }
              }
              final countPhonetic =
                  choosePhonetics.length >= 2 ? 2 : choosePhonetics.length;

              final meanings = state.definition?.meanings ?? [];

              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ...List.generate(
                          countPhonetic,
                          (index) =>
                              audioWidget(choosePhonetics.elementAt(index))),
                      ...List.generate(
                        meanings.length,
                        (index) => definitionWidget(meanings.elementAt(index)),
                      ),
                      FSizeBoxs.h20,
                    ]),
              );
            },
          ),
        ));
  }

  Widget definitionWidget(Meaning meaning) {
    final countDefinition =
        meaning.definitions!.length >= 3 ? 3 : meaning.definitions!.length;
    return Padding(
      padding: const EdgeInsets.only(top: FPaddingSizes.s10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '[${meaning.partOfSpeech}]',
            style: AppTextStyles.caption.copyWith(fontStyle: FontStyle.italic),
          ),
          ...List.generate(
              countDefinition,
              (index) =>
                  Text('${meaning.definitions?.elementAt(index).definition}')),
        ],
      ),
    );
  }

  final audioManager = GlobalVariables.getIt<FAudioManager>();

  Widget audioWidget(Phonetic phonetic) {
    final String audioUrl = phonetic.audio!;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => audioManager.stopAndPlayAudio(audioUrl),
        splashColor: AppColors.colorPrimary.withOpacity(0.3),
        child: Wrap(
          children: [
            Text(phonetic.text!, style: AppTextStyles.phonetic),
            FSizeBoxs.w10,
            const Icon(
              AppIcons.iconVolumn,
              color: AppColors.colorPrimary,
            ),
          ],
        ),
      ),
    );
  }
}
