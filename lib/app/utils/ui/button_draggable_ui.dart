import 'package:flutter/material.dart';

class ButtonDraggableUi extends StatelessWidget {
  final Widget builSheet;
  final Color? color;
  final Color? colorTx;
  final String? txBtn;
  const ButtonDraggableUi(
      {Key? key,
      required this.builSheet,
      this.color = Colors.red,
      this.txBtn = 'Button',
      this.colorTx = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: 50,
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Text(txBtn!, style: TextStyle(color: colorTx)),
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (context) => builSheet);
      },
    );
  }
}
