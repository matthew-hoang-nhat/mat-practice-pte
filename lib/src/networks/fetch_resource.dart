import 'package:mat_practice_pte/src/utils/global_variables.dart';

import 'package:mat_practice_pte/src/widgets/f_app.dart';

import 'f_result.dart';

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
    GlobalVariables.getIt<FApp>()
        .showToast(resource.error ?? 'Error something');
  }
}
