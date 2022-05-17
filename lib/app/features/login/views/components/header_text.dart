part of login_page;

class _HeaderText extends StatelessWidget {
  const _HeaderText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Login Now", style: Theme.of(context).textTheme.headline5),
        const SizedBox(height: 5),
        const Text("Please enter your phone number to login")
      ],
    );
  }
}
