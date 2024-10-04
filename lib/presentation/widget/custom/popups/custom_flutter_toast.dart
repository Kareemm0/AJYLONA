import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/constants/app_colors.dart';

void showToast({
  required String message,
}) {
  Fluttertoast.showToast(
    fontSize: 16,
    toastLength: Toast.LENGTH_LONG,
    msg: message,
    backgroundColor: AppColors.kprimaryColor,
  );
}
