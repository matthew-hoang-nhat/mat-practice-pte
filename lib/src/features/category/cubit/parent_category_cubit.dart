import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/app_paths.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/networks/models/category/f_category.dart';
part 'parent_category_state.dart';

class ParentCategoryCubit extends Cubit<ParentCategoryState> {
  ParentCategoryCubit() : super(ParentCategoryState.init());

  initCubit() async {}

  categoryOnClick(context, {required String id}) {
    FCoordinator.pushNamed(AppPaths.drawer, params: {'id': id});
  }

  separateCategories(List<FCategory> categories) {
    final readingCategories = <FCategory>[];
    final listeningCategories = <FCategory>[];

    for (var item in categories) {
      if (item.id.contains('L')) {
        listeningCategories.add(item);
      } else {
        readingCategories.add(item);
      }
    }

    emit(state.copyWith(
        readingCategories: readingCategories,
        listeningCategories: listeningCategories));
  }
}
