import 'package:mat_practice_pte/src/utils/global_variables.dart';
import 'package:mat_practice_pte/src/utils/remote/f_result.dart';
import 'package:mat_practice_pte/src/widgets/mat.dart';

Future<void> fetchResource<T>(
  FResult<T> resource, {
  Function()? onSuccess,
  Function()? onError,
}) async {
  if (onSuccess != null && resource.isSuccess) {
    onSuccess();
  }
  if (onError != null && resource.isError) {
    onError();
  } else if (resource.isError) {
    GlobalVariables.getIt<MatApp>()
        .showToast(resource.error ?? 'Error something');
  }
}
