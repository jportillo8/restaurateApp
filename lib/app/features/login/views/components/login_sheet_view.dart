part of login_page;

class _LoginSheetView extends StatefulWidget {
  const _LoginSheetView({Key? key}) : super(key: key);

  @override
  State<_LoginSheetView> createState() => _LoginSheetViewState();
}

final emailC = TextEditingController();
final passC = TextEditingController();

class _LoginSheetViewState extends State<_LoginSheetView> {
  @override
  Widget build(BuildContext context) {
    return _makeDismissibleLogin(
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
          child: ListView(controller: controller, children: [
            _ElementsLogin(emailCtrl: emailC, passwordCtrl: passC)
          ]),
        ),
      ),
    );
  }
}

class _ElementsLogin extends StatelessWidget {
  final TextEditingController emailCtrl;
  final TextEditingController passwordCtrl;

  const _ElementsLogin({
    Key? key,
    required this.emailCtrl,
    required this.passwordCtrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(children: [
        _lineSeparator(),
        _textTitleLogin(),
        _textSubtitleLogin(),
        const SizedBox(width: double.infinity, child: Text('Email*')),
        AppCustomInput(
          icon: FontAwesomeIcons.envelope,
          placeholder: 'Enter your email...',
          textController: emailCtrl,
          keyboarType: TextInputType.emailAddress,
        ),
        const SizedBox(width: double.infinity, child: Text('Password*')),
        AppCustomInput(
          icon: FontAwesomeIcons.lock,
          placeholder: 'Enter your password...',
          textController: passwordCtrl,
          keyboarType: TextInputType.text,
          isPassword: true,
        ),
        Padding(
          padding: EdgeInsets.only(top: Get.height * 0.03),
          child: CustomBtn(
              width: double.infinity,
              height: 50,
              onPressed: () {},
              color: Colors.black87,
              colorTx: Colors.white,
              txBtn: 'Login'),
        ),
        const _FooterLogin(),
      ]),
    );
  }
}

class _FooterLogin extends StatelessWidget {
  const _FooterLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Dont have any account?'),
      MaterialButton(
          child: const Text('Sign Up'),
          onPressed: () {
            Navigator.of(context).pop();
          })
    ]);
  }
}

Widget _textSubtitleLogin() {
  return Container(
    alignment: Alignment.bottomLeft,
    padding: const EdgeInsets.only(bottom: 30, top: 10),
    child: const Text('See the list of likes of your food to order ',
        style: TextStyle(
            color: Colors.black38, fontWeight: FontWeight.bold, fontSize: 15)),
  );
}

Widget _textTitleLogin() {
  return Container(
    alignment: Alignment.bottomLeft,
    child: const Text('Welcome Back!',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25)),
  );
}

Widget _lineSeparator() {
  return Container(
      margin: EdgeInsets.only(bottom: Get.height * 0.1),
      width: 50,
      height: 3,
      color: Colors.black38);
}

Widget _makeDismissibleLogin({required Widget child, required context}) =>
    GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => Navigator.of(context).pop(),
      child: GestureDetector(onTap: () {}, child: child),
    );
