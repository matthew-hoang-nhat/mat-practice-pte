import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/features/search/cubit/search_state.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit({required this.sourceCategories}) : super(SearchState.init()) {
    initCubit();
  }
  final List<FCategory> sourceCategories;
  final textFieldController = TextEditingController();

  void initCubit() async {
    const readingTab = 0;
    tabOnClick(readingTab);
    if (state.currenCategories.isNotEmpty) {
      emit(state.copyWith(selectedCategory: state.currenCategories.first));
    }
  }

  void lessonOnClick(DetailLesson lesson) {
    const undefinedInitIndex = -1;
    FCoordinator.pushDetailLesson(
        initIdLesson: lesson.id,
        initIndex: undefinedInitIndex,
        idCategory: lesson.idCategory,
        filterMark: null,
        isQNumDescending: null,
        filterPracticed: null);
  }

  void categoryOnClick(FCategory category) {
    emit(state.copyWith(selectedCategory: category));
    if (_isCanSearch()) {
      search();
    }
  }

  bool _isCanSearch() {
    return textFieldController.text.trim().isNotEmpty;
  }

  final searchRepo = DomainManager.instance.lessonRepository;

  void submitSearchOnClick(String value) => search();

  Future<void> search() async {
    if (isLoading == true) return;
    isLoading = true;
    final lessonsResult = await searchRepo.searchLessons(
        idCategory: state.selectedCategory!.id, text: textFieldController.text);
    fetchResource(
      lessonsResult,
      onSuccess: () {
        emit(state.copyWith(lessons: lessonsResult.data));
      },
    );

    isLoading = false;
  }

  void tabOnClick(int value) {
    final isReading = (value == 0);
    switch (isReading) {
      case true:
        final readingCategories = sourceCategories
            .where((element) => element.id[0] == ('R'))
            .toList();
        emit(state.copyWith(
            tab: SearchTab.reading, currenCategories: readingCategories));
        break;
      case false:
        final listeningCategories = sourceCategories
            .where((element) => element.id[0] == ('L'))
            .toList();
        emit(state.copyWith(
          tab: SearchTab.listening,
          currenCategories: listeningCategories,
        ));
        break;
      default:
    }
  }

  bool get isLoading => state.isLoading;
  set isLoading(bool value) => emit(state.copyWith(isLoading: value));
}
