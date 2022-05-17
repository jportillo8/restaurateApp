part of login_page;

class _Background extends StatelessWidget {
  final boxDecoration = const BoxDecoration(
      gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [
        0.2,
        0.8
      ],
          colors: [
        Color(0xff2E305F),
        Color(0xff202333),
      ]));

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Purple Gradient
        Container(decoration: boxDecoration),
        // Positioned(top: -100, left: -30, child: _PinkBox())
      ],
    );
  }
}

// class _PinkBox extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Transform.rotate(
//       angle: -pi / 5.0,
//       child: Container(
//           width: 360,
//           height: 360,
//           decoration: BoxDecoration(
//               gradient: const LinearGradient(colors: [
//                 Color.fromRGBO(236, 98, 188, 1),
//                 Color.fromRGBO(241, 142, 172, 1)
//               ]),
//               borderRadius: BorderRadius.circular(80))),
//     );
//   }
// }
