import 'package:dev9lu_market_flutter/app/features/client/controllers/client_pofile_update_controller.dart';
import 'package:dev9lu_market_flutter/app/shared_components/shared_components.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class ClientProfileUpdatePage extends StatelessWidget {
  const ClientProfileUpdatePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _makeDismissibleUpdate(
        context: context,
        child: DraggableScrollableSheet(
          initialChildSize: 0.77,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (_, controller) => Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                color: Colors.white),
            padding: const EdgeInsets.all(16.0),
            child:
                ListView(controller: controller, children: [_ElementsUpdate()]),
          ),
        ));
  }
}

Widget _makeDismissibleUpdate({required Widget child, required context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(
          onTap: () {
            print('nada especial');
          },
          child: child),
    );

class _ElementsUpdate extends GetView<ClientProfileUpdateController> {
  const _ElementsUpdate({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        _lineSeparator(),
        Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _UserImage(),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                _textTitleRegister(),
                _textSubtitleRegister(),
              ])
            ],
          ),
        ),
        const SizedBox(width: double.infinity, child: Text('Name*')),
        CustomInput(
          icon: FontAwesomeIcons.userAstronaut,
          placeholder: 'Enter your name...',
          textController: controller.nameCtrl,
          keyboarType: TextInputType.text,
        ),
        const SizedBox(width: double.infinity, child: Text('Phone Number*')),
        CustomInput(
          icon: FontAwesomeIcons.phone,
          placeholder: 'Enter your phone Number...',
          textController: controller.phoneCtrl,
          keyboarType: TextInputType.phone,
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: CustomBtn(
              width: double.infinity,
              height: 50,
              onPressed: () {
                controller.updateClient(context);
              },
              color: Colors.black87,
              colorTx: Colors.white,
              txBtn: 'Actulizar'),
        ),
        const _FooterRegister(),
      ]),
    );
  }
}

class _FooterRegister extends GetView<ClientProfileUpdateController> {
  const _FooterRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Already a have a account?'),
      MaterialButton(child: const Text('Login'), onPressed: () {})
    ]);
  }
}

Widget _textSubtitleRegister() {
  return const Text('Cambia tu información personal',
      style: TextStyle(
          color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 13));
}

Widget _textTitleRegister() {
  return const Text('Actualizar información',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 17));
}

class _UserImage extends GetView<ClientProfileUpdateController> {
  const _UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.showAlertDialog();
      },
      child: SizedBox(
          width: Get.width * 0.25,
          height: Get.width * 0.25,
          child: GetBuilder<ClientProfileUpdateController>(
            builder: (controller) => CircleAvatar(
                backgroundColor: Colors.lightBlue,
                backgroundImage: controller.imageFile != null
                    ? FileImage(controller.imageFile!)
                    : null,
                child: controller.imageFile != null
                    ? null
                    : controller.user.image != null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundImage:
                                NetworkImage(controller.user.image!),
                          )
                        : Icon(
                            FontAwesomeIcons.userAstronaut,
                            color: Colors.white,
                          )),
          )),
    );
  }
}

Widget _lineSeparator() {
  return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.08),
      width: 50,
      height: 3,
      color: Colors.black38);
}
