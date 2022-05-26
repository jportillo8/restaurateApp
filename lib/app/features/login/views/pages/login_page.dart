library login_page;

import 'package:dev9lu_market_flutter/app/features/login/controllers/register_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:dev9lu_market_flutter/app/features/login/controllers/login_controller.dart';
import 'package:dev9lu_market_flutter/app/shared_components/shared_components.dart';
// import 'dart:math';

part '../components/background.dart';
part '../components/image_cover.dart';
part '../components/button_draggable.dart';
part '../components/header_text.dart';
part '../components/login_sheet_view.dart';
part '../components/register_sheet_view.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            SizedBox(
                width: Get.width,
                height: Get.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    _Background(),
                    Column(children: const [
                      Spacer(flex: 6),
                      Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: _ImageCover()),
                      Spacer(flex: 1),
                      _HeaderText(),
                      Spacer(flex: 3),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: _ButtonDraggable(
                            txBtn: 'Register', builSheet: _RegisterSheetView()),
                      ),
                      Spacer(flex: 1),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 30),
                        child: _ButtonDraggable(
                            txBtn: 'Login',
                            color: Colors.lightBlue,
                            builSheet: _LoginSheetView()),
                      ),
                      Spacer(flex: 3),
                    ]),
                  ],
                ))
          ]))
        ],
      ),
    );
  }
}
