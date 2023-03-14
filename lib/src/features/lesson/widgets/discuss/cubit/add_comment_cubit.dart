import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mat_practice_pte/src/configs/routes/coordinator.dart';
import 'package:mat_practice_pte/src/networks/fetch_resource.dart';
import 'package:mat_practice_pte/src/networks/firestore/repository/domain_manager.dart';
import 'package:mat_practice_pte/src/networks/models/lesson_data/lesson_discuss.dart';
import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/widgets/f_app.dart';

part 'add_comment_state.dart';

class AddCommentCubit extends Cubit<AddCommentState> {
  AddCommentCubit(this.idCategory, this.idLesson, this.onSuccess)
      : super(AddCommentState.init());
  final String idCategory;
  final String idLesson;
  final Function() onSuccess;
  String get uid => GlobalVariables.auth.currentUser!.uid;

  final controller = TextEditingController();
  final discussRepo = DomainManager.instance.discussRepository;
  final fShows = GlobalVariables.getIt<FApp>();

  bool isValidate() {
    return controller.text.trim().isNotEmpty;
  }

  setIsLoading(bool value) {
    emit(state.copyWith(isLoading: value));
  }

  Future<void> sendOnClick() async {
    final content = controller.text;

    if (isValidate() == false) {
      fShows.showToast("Enter your comment.", type: FShowType.warning);
      return;
    }
    setIsLoading(true);
    final discuss = LessonDiscuss(
        idCategory: idCategory,
        idLesson: idLesson,
        content: content,
        uid: uid,
        reactions: [],
        replies: []);
    final result = await discussRepo.addDiscuss(discuss);
    fetchResource(
      result,
      onSuccess: () {
        onSuccess();
        FCoordinator.onBack();
        fShows.showToast('Successfully Added Comment');
      },
    );
    setIsLoading(false);
  }
}
