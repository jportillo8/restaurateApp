part of login_page;

class _ImageCover extends StatelessWidget {
  const _ImageCover({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.6,
      height: Get.width * 0.6,
      child: CircleAvatar(
        backgroundColor: const Color.fromARGB(255, 160, 132, 187),
        child: Image.asset(
          'assets/images/delivery01.png',
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
