import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/core/values/colors.dart';
import 'package:dailyateam/app/modules/term_of_use/widgets/termofuse_body.dart';
import 'package:flutter/material.dart';

class TermOfUsePage extends StatelessWidget {
  const TermOfUsePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BaseAppBar(
        bgColor: Colors.white,
        fgColor: navyColor,
        title: 'Term Of Use',
      ),
      body: TermOfUseBody(),
    );
  }
}
