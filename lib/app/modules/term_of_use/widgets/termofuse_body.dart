import 'package:dailyateam/app/components/base_text.dart';
import 'package:dailyateam/app/modules/term_of_use/controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class TermOfUseBody extends StatelessWidget {
  TermOfUseBody({super.key});
  final controller = Get.find<TermOfUseController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 30,
          width: Get.width,
          color: Colors.red.shade200,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 15,
          ),
          child: Center(
            child: BaseText(
              text: 'This page still under maintenance',
              bold: FontWeight.w600,
              color: Colors.red.shade800,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: SvgPicture.asset(
            'assets/images/anyargroup.svg',
            width: 250,
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
            child: Material(
              color: Colors.white,
              elevation: 1,
              borderRadius: BorderRadius.circular(10),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: ListView(
                  physics: const ClampingScrollPhysics(),
                  padding: EdgeInsets.zero,
                  children: const [
                    BaseText(
                      text:
                          ' Term of use in down below have you read before use this aplication. User this aplication have show acceptanceand obedience to term of use in down below',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    BaseText(
                      text:
                          ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis nibh nisl, faucibus mi eget arcu. Elit in molestie amet, tellus, semper ullamcorper lorem porttitor. Mi, donec tortor, sapien, malesuada fringilla amet, ultrices. Ut morbi massa orci, sed malesuada congue lacus, id amet. Faucibus adipiscing amet, sit non amet nec. Ridiculus sagittis, arcu, lacus facilisis mattis amet, nec feugiat volutpat. Nisl enim volutpat faucibus vel quam vestibulum eget purus. Varius sed id quis ornare diam. Phasellus bibendum scelerisque fames risus neque convallis. Bibendum',
                      textAlign: TextAlign.justify,
                    ),
                    SizedBox(height: 5),
                    BaseText(
                      text:
                          'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Magnis nibh nisl, faucibus mi eget arcu. Elit in molestie amet, tellus, semper ullamcorper lorem porttitor. Mi, donec tortor, sapien, malesuada fringilla amet, ultrices. Ut morbi massa orci, sed malesuada congue lacus, id amet. Faucibus adipiscing amet, sit non amet nec. Ridiculus sagittis, arcu, lacus facilisis mattis amet, nec feugiat volutpat. Nisl enim volutpat faucibus vel quam vestibulum eget purus. Varius sed id quis ornare diam. Phasellus bibendum scelerisque fames risus neque convallis. Bibendum',
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
