import 'package:dailyateam/app/modules/dashboard/widgets/account/account_footer.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/account/account_header.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/account/account_menu.dart';
import 'package:dailyateam/app/modules/dashboard/widgets/account/account_tabinfo.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        AccountHeader(),
        AccountTabInfo(),
        AccountMenu(),
        AccountFooter(),
      ],
    );
  }
}
