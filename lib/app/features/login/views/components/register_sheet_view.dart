part of login_page;

class _RegisterSheetView extends StatefulWidget {
  const _RegisterSheetView({Key? key}) : super(key: key);

  @override
  State<_RegisterSheetView> createState() => _BoxRegisterSheet();
}

final generiC = TextEditingController();

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
          child: ListView(
              controller: controller,
              children: [_ElementsRegister(controller: generiC)]),
        ),
      ),
    );
  }
}

class _ElementsRegister extends StatelessWidget {
  final TextEditingController controller;
  const _ElementsRegister({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(children: [
        _lineSeparator(),
        _textTitleRegister(),
        _textSubtitleRegister(),
        const SizedBox(width: double.infinity, child: Text('Name*')),
        AppCustomInput(
          icon: FontAwesomeIcons.userAstronaut,
          placeholder: 'Enter your name...',
          textController: controller,
          keyboarType: TextInputType.text,
        ),
        const SizedBox(width: double.infinity, child: Text('Phone Number*')),
        AppCustomInput(
          icon: FontAwesomeIcons.phone,
          placeholder: 'Enter your phone Number...',
          textController: controller,
          keyboarType: TextInputType.phone,
        ),
        const SizedBox(width: double.infinity, child: Text('Email*')),
        AppCustomInput(
          icon: FontAwesomeIcons.envelope,
          placeholder: 'Enter your email...',
          textController: controller,
          keyboarType: TextInputType.emailAddress,
        ),
        const SizedBox(width: double.infinity, child: Text('Password*')),
        AppCustomInput(
          icon: FontAwesomeIcons.lock,
          placeholder: 'Enter your password...',
          textController: controller,
          keyboarType: TextInputType.text,
          isPassword: true,
        ),
        AppCustomInput(
          icon: FontAwesomeIcons.lock,
          placeholder: 'Corfirm your password...',
          textController: controller,
          keyboarType: TextInputType.text,
          isPassword: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: size.height * 0.03),
          child: CustomBtn(
              width: double.infinity,
              height: 50,
              onPressed: () {},
              color: Colors.black87,
              colorTx: Colors.white,
              txBtn: 'Sign Up'),
        ),
        const _FooterRegister(),
      ]),
    );
  }
}

class _FooterRegister extends StatelessWidget {
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
  return Container(
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.only(bottom: 30, top: 10),
    child: const Text('register your data ',
        style: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 15)),
  );
}

Widget _textTitleRegister() {
  return Container(
    alignment: Alignment.bottomLeft,
    child: const Text('Create an Accout',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
  );
}

Widget _makeDismissibleRegister({required Widget child, required context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(onTap: () {}, child: child),
    );
