import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/components/base_textbutton.dart';
import 'package:dailyateam/app/core/utils/api_url.dart';
import 'package:dailyateam/app/core/values/app_helpers.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({
    super.key,
    required this.image,
    required this.name,
    required this.jobName,
    this.onPressed,
    this.index,
  });

  final String image;
  final String name;
  final String jobName;
  final void Function()? onPressed;
  final int? index;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      surfaceTintColor: Colors.white,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(bottom: index == 24 ? 0 : 10),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Row(
          children: [
            CircleAvatar(
              radius: 35,
              backgroundColor: softBlue,
              backgroundImage: image == '' || image == '0' || image == ''
                  ? null
                  : Image.network(
                      '${ApiUrl.storageUrl}/$image',
                      loadingBuilder: (context, child, loadingProgress) {
                        return loadingProgress == null
                            ? child
                            : const Center(
                                child: CupertinoActivityIndicator(
                                  color: navyColor,
                                ),
                              );
                      },
                    ).image,
              foregroundColor: navyColor,
              child: image == '' || image == '0'
                  ? BaseText(
                      text: AppHelpers.avatarName(name),
                      size: 26,
                      bold: FontWeight.w600,
                      textAlign: TextAlign.center,
                    )
                  : null,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(
                    text: name,
                    bold: FontWeight.w600,
                    maxLines: 2,
                  ),
                  BaseText(
                    text: jobName,
                    size: 12,
                    color: Colors.grey.shade600,
                    bold: FontWeight.w500,
                    maxLines: 2,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10),
            BaseTextButton(
              size: 12,
              color: navyColor,
              text: 'Detail',
              onPressed: onPressed,
            )
          ],
        ),
      ),
    );
  }
}
