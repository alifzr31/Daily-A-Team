import 'package:dailyateam/app/modules/team/widgets/team_appbar.dart';
import 'package:dailyateam/app/modules/team/widgets/team_header.dart';
import 'package:dailyateam/app/modules/team/widgets/team_list.dart';
import 'package:flutter/material.dart';

class TeamPage extends StatelessWidget {
  const TeamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TeamAppbar(),
      body: Column(
        children: [
          TeamHeader(),
          TeamList(),
        ],
      ),
    );
  }
}
