import 'package:dailyateam/app/components/base_appbar.dart';
import 'package:dailyateam/app/modules/updater/widgets/updater_body.dart';
import 'package:flutter/material.dart';

class UpdaterPage extends StatelessWidget {
  const UpdaterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: const BaseAppBar(
          title: '',
          height: 0,
          bgColor: Colors.white,
        ),
        body: UpdaterBody(),
      ),
    );
  }
}
