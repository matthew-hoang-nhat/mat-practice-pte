import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
import 'package:mat_practice_pte/src/networks/models/lesson/detail_lesson.dart';
import 'package:mat_practice_pte/src/utils/wrapper.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part 'drawer_state.dart';

class DrawerCubit extends Cubit<DrawerState> {
  DrawerCubit({required String idCategory})
      : super(DrawerInitial(
          lessons: const [],
          idCategory: idCategory,
          category: null,
          practiced: null,
          mark: null,
          isIdDescending: false,
          isLoading: false,
        ));

  @override
  void emit(DrawerState state) {
    if (isClosed) return;
    super.emit(state);
  }

  final _lessonRepo = DomainManager.instance.lessonRepository;
  final _categoryRepo = DomainManager.instance.categoryRepository;

  initCubit() async {
    _fetchCategory();

    _setLoading(true);
    await _refreshLessons();
    _setLoading(false);
  }

  iconNewOnClick(context) {
    emit(state.copyWith(isNew: !state.isIdDescending));
    _fetchData();
  }

  _setLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  okButtonOnClick() {
    SmartDialog.dismiss();
    _fetchData();
  }

  resetButtonOnClick() {
    SmartDialog.dismiss();
    emit(state.copyWith(
      mark: Wrapper(null),
      practiced: Wrapper(null),
    ));
    _fetchData();
  }

  _fetchData() async {
    _setLoading(true);
    await _fetchLessons();
    _setLoading(false);
  }

  markOnClick(context, {required String? mark}) async {
    if (mark == state.mark) {
      emit(state.copyWith(mark: Wrapper(null)));
    } else {
      emit(state.copyWith(
        mark: Wrapper(mark),
        practiced: Wrapper(null),
      ));
    }
  }

  pracStatusOnClick({required String practiced}) async {
    if (practiced == state.practiced) {
      emit(state.copyWith(practiced: Wrapper(null)));
    } else {
      emit(state.copyWith(
        practiced: Wrapper(practiced),
        mark: Wrapper(null),
      ));
    }
  }

  RefreshController refreshController = RefreshController();

  void onRefresh() async {
    await _refreshLessons();
    refreshController.refreshCompleted();
  }

  void onLoading() async {
    await _fetchNextPageLessons();
    refreshController.loadComplete();
  }

  _fetchCategory() async {
    final result = await _categoryRepo.getCategory(id: state.idCategory);
    fetchResource(result, onSuccess: () {
      emit(state.copyWith(category: result.data));
    });
  }

  _refreshLessons() async {
    emit(state.copyWith(lessons: []));
    final filterMark =
        state.mark != null ? FilterMarkEnum.tryParse(state.mark!) : null;
    final filterPracticed = state.practiced != null
        ? FilterPracticedEnum.tryParse(state.practiced!)
        : null;
    final result = await _lessonRepo.getLessons(
        idCategory: state.idCategory,
        filterMark: filterMark,
        filterPracticed: filterPracticed,
        isQNumDescending: state.isIdDescending);

    fetchResource(result, onSuccess: () {
      emit(state.copyWith(lessons: result.data));
    });
  }

  lessonOnClick({required String idLesson, required int index}) {
    final mark =
        state.mark != null ? FilterMarkEnum.tryParse(state.mark!) : null;
    final practiced = state.practiced != null
        ? FilterPracticedEnum.tryParse(state.practiced!)
        : null;

    FCoordinator.pushDetailLesson(
        initIdLesson: idLesson,
        idCategory: state.idCategory,
        isQNumDescending: state.isIdDescending,
        filterMark: mark,
        filterPracticed: practiced,
        initIndex: index);
  }

  int currentPageLesson = -1;
  bool isFetchNextPageLesson = false;

  _fetchLessons({String? idLastLesson}) async {
    final filterMark =
        state.mark != null ? FilterMarkEnum.tryParse(state.mark!) : null;
    final filterPracticed = state.practiced != null
        ? FilterPracticedEnum.tryParse(state.practiced!)
        : null;
    final result = await _lessonRepo.getLessons(
        idLastLesson: idLastLesson,
        idCategory: state.idCategory,
        isQNumDescending: state.isIdDescending,
        filterPracticed: filterPracticed,
        filterMark: filterMark);

    final mark =
        state.mark != null ? FilterMarkEnum.tryParse(state.mark!) : null;
    final practiced = state.practiced != null
        ? FilterPracticedEnum.tryParse(state.practiced!)
        : null;
    final resultCount = await _lessonRepo.getCountFoundLesson(
        idCategory: state.idCategory,
        filterMark: mark,
        filterPracticed: practiced);

    final newFoundLesson = resultCount.data;
    final newLessons = result.data;

    fetchResource(result, onSuccess: () {
      emit(state.copyWith(
          lessons: newLessons,
          category: state.category?.copyWith(foundLesson: newFoundLesson)));
    });
  }

  _fetchNextPageLessons() async {
    if (isFetchNextPageLesson) return;

    isFetchNextPageLesson = true;
    final filterMark =
        state.mark != null ? FilterMarkEnum.tryParse(state.mark!) : null;
    final filterPracticed = state.practiced != null
        ? FilterPracticedEnum.tryParse(state.practiced!)
        : null;

    final result = await _lessonRepo.getLessons(
        idCategory: state.idCategory,
        idLastLesson: state.lessons.last.id,
        filterMark: filterMark,
        isQNumDescending: state.isIdDescending,
        filterPracticed: filterPracticed);
    fetchResource(result, onSuccess: () {
      final oldLessons = state.lessons;
      final newLessons = result.data!;
      emit(state.copyWith(lessons: [...oldLessons, ...newLessons]));
    });

    isFetchNextPageLesson = false;
  }
}
