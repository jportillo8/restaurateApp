import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev9lu_market_flutter/app/features/client/controllers/client_profile_info_controller.dart';
import 'package:dev9lu_market_flutter/app/features/client/views/pages/client_profile_update_page.dart';
import 'package:dev9lu_market_flutter/app/shared_components/shared_components.dart';
import 'package:dev9lu_market_flutter/app/utils/ui/button_draggable_ui.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClientProfileInfoPage extends GetView<ClientProfileInfoController> {
  const ClientProfileInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();

    return Scaffold(
      body: Obx(() => CustomScrollView(
            slivers: [
              SliverList(
                  delegate: SliverChildListDelegate([
                SafeArea(
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    height: Get.height * 0.1,
                    child: IconButton(
                        icon: Icon(FontAwesomeIcons.userCheck),
                        onPressed: () {}),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                      decoration: buildBoxDecoration(),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          _infoUserAndImage(),
                          Text('${controller.user.value.name}',
                              style: TextStyle(
                                  fontSize: 19, fontWeight: FontWeight.bold)),
                          SizedBox(height: Get.height * 0.03),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListTile(
                              style: ListTileStyle.drawer,
                              // horizontalTitleGap: 30,
                              leading: Icon(FontAwesomeIcons.envelope),
                              title: Text('${controller.user.value.email}'),
                              // subtitle: Text('email'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: ListTile(
                              // contentPadding: EdgeInsets.all(10),
                              style: ListTileStyle.drawer,
                              // horizontalTitleGap: 30,
                              leading: Icon(FontAwesomeIcons.phone),
                              title: Text('${controller.user.value.phone}'),
                              // subtitle: Text('phone'),
                            ),
                          ),
                          SizedBox(height: Get.height * 0.05),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: ButtonDraggableUi(
                                txBtn: 'Actualizar Datos',
                                color: Colors.deepOrange,
                                builSheet: ClientProfileUpdatePage()),
                          ),
                          SizedBox(height: Get.height * 0.05),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 30,
                      top: 40,
                      child: IconButton(
                          icon: Icon(FontAwesomeIcons.powerOff),
                          onPressed: () => controller.logout()),
                    ),
                  ],
                ),
              ]))
            ],
          )),
    );
  }

  BoxDecoration buildBoxDecoration() => BoxDecoration(
        color: Colors.black.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 5,
            spreadRadius: 5,
          ),
        ],
      );
}

class _infoUserAndImage extends GetView<ClientProfileInfoController> {
  const _infoUserAndImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(controller.user.value.image);
    return Stack(
      children: [
        Container(
          width: Get.width * 0.22,
          height: Get.height * 0.22,
          decoration: const BoxDecoration(shape: BoxShape.circle),
          child: CachedNetworkImage(
            imageUrl: controller.user.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                        spreadRadius: 10,
                        blurStyle: BlurStyle.outer,
                        color: Colors.black.withOpacity(0.9),
                        blurRadius: 50,
                        offset: const Offset(0, 0))
                  ],
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: imageProvider,
                  )),
            ),
            placeholder: (contex, url) =>
                Image.asset('assets/images/delivery01.png'),
            errorWidget: (context, url, error) =>
                Image.asset('assets/images/delivery01.png'),
          ),
        ),
      ],
    );
  }
}
