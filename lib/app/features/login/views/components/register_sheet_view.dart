part of login_page;

class _RegisterSheetView extends StatefulWidget {
  const _RegisterSheetView({Key? key}) : super(key: key);

  @override
  State<_RegisterSheetView> createState() => _BoxRegisterSheet();
}

class _BoxRegisterSheet extends State<_RegisterSheetView> {
  @override
  Widget build(BuildContext context) {
    return _makeDismissibleRegister(
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
              ListView(controller: controller, children: [_ElementsRegister()]),
        ),
      ),
    );
  }
}

class _ElementsRegister extends GetView<RegisterController> {
  const _ElementsRegister({
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
        const SizedBox(width: double.infinity, child: Text('Email*')),
        CustomInput(
          icon: FontAwesomeIcons.envelope,
          placeholder: 'Enter your email...',
          textController: controller.emailCtrl,
          keyboarType: TextInputType.emailAddress,
        ),
        const SizedBox(width: double.infinity, child: Text('Password*')),
        CustomInput(
          icon: FontAwesomeIcons.lock,
          placeholder: 'Enter your password...',
          textController: controller.passwordCtrl,
          keyboarType: TextInputType.text,
          isPassword: true,
        ),
        CustomInput(
          icon: FontAwesomeIcons.lock,
          placeholder: 'Corfirm your password...',
          textController: controller.confirmPassCtrl,
          keyboarType: TextInputType.text,
          isPassword: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: CustomBtn(
              width: double.infinity,
              height: 50,
              onPressed: () {
                controller.register(context);
              },
              color: Colors.black87,
              colorTx: Colors.white,
              txBtn: 'Sign Up'),
        ),
        const _FooterRegister(),
      ]),
    );
  }
}

class _FooterRegister extends GetView<RegisterController> {
  const _FooterRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Already a have a account?'),
      MaterialButton(
          child: const Text('Login'),
          onPressed: () {
            controller.goToLoginSheet(context, _LoginSheetView());
          })
    ]);
  }
}

Widget _textSubtitleRegister() {
  return const Text('register your data ',
      style: TextStyle(
          color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 15));
}

Widget _textTitleRegister() {
  return const Text('Create an Accout',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25));
}

Widget _makeDismissibleRegister({required Widget child, required context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(onTap: () {}, child: child),
    );

class _UserImage extends GetView<RegisterController> {
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
          child: GetBuilder<RegisterController>(
            builder: (controller) => CircleAvatar(
                backgroundColor: Colors.lightBlue,
                backgroundImage: controller.imageFile != null
                    ? FileImage(controller.imageFile!)
                    : null,
                child: controller.imageFile != null
                    ? null
                    : const Icon(
                        FontAwesomeIcons.userAstronaut,
                        color: Colors.white,
                      )),
          )),
    );
  }
}
