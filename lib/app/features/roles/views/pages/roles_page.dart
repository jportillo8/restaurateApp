import 'package:cached_network_image/cached_network_image.dart';
import 'package:dev9lu_market_flutter/app/features/roles/controllers/roles_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RolesPage extends GetView<RolesController> {
  const RolesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final roles = controller.user.roles;
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(Get.width * 0.4),
            child: SafeArea(
              child: Container(
                alignment: Alignment.center,
                height: Get.height * 0.2,
                // color: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Text('Selecciona tu categoria',
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w500)),
                ),
              ),
            )),
        body: CustomScrollView(
          // anchor: 0.1,
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: roles!.length,
              (context, index) => _RoleItem(
                  imageUrl: roles[index].image!, name: roles[index].name!),
            )),
          ],
        ));
  }
}

class _RoleItem extends StatelessWidget {
  const _RoleItem({
    Key? key,
    required this.imageUrl,
    required this.name,
  }) : super(key: key);

  final String imageUrl;
  final String name;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (() => print(name)),
      child: Container(
        decoration: const BoxDecoration(shape: BoxShape.circle),
        width: Get.width * 0.22,
        height: Get.height * 0.22,
        padding: const EdgeInsets.only(bottom: 30, top: 30, right: 100),
        child: Row(
          children: [
            SizedBox(width: Get.width * 0.15),
            CachedNetworkImage(
              width: Get.width * 0.23,
              height: Get.height * 0.23,
              imageUrl: imageUrl,
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          spreadRadius: 10,
                          blurStyle: BlurStyle.outer,
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 20,
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
            SizedBox(width: Get.width * 0.05),
            // Spacer(flex: 2),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(name.toLowerCase().capitalize!,
                  style: const TextStyle(
                      fontWeight: FontWeight.w300, fontStyle: FontStyle.italic),
                  textDirection: TextDirection.rtl),
            ),
          ],
        ),
      ),
    );
  }
}
