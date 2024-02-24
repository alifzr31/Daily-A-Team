import 'package:cool_alert/cool_alert.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/material.dart';

void cancelAlert(
  BuildContext context, {
  String? request,
  DateTime? requestDate,
  Function()? onConfirmBtnTap,
}) {
  CoolAlert.show(
    context: context,
    type: CoolAlertType.confirm,
    loopAnimation: false,
    barrierDismissible: false,
    confirmBtnColor: navyColor,
    closeOnConfirmBtnTap: false,
    title: 'Are You Sure',
    text: 'Cancel $request request for ${AppHelpers.dateFormat(requestDate ?? DateTime(0000))}',
    cancelBtnText: 'No',
    confirmBtnText: 'Yes',
    onConfirmBtnTap: onConfirmBtnTap,
  );
}
