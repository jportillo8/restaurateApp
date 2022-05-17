part of ui_utils;

class CustomBtn extends StatelessWidget {
  final Function() onPressed;
  final Color? color;
  final Color? colorTx;
  final String? txBtn;
  final double? width;
  final double? height;

  const CustomBtn(
      {Key? key,
      this.color = Colors.black,
      this.colorTx = Colors.white,
      this.txBtn = 'Btn',
      required this.onPressed,
      this.width = 150,
      this.height = 50})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: MaterialButton(
        minWidth: width,
        height: height,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        onPressed: onPressed,
        child: Text(txBtn!, style: TextStyle(color: colorTx)),
      ),
    );
  }
}
