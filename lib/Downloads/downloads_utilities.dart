import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix_ui/API/tmdb_links.dart';

class ElevatedButtonSetUP extends StatelessWidget {
  const ElevatedButtonSetUP({Key? key, required this.onpressed})
      : super(key: key);
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        child: const Text(
          'Set Up',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        onPressed: onpressed,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blue)),
      ),
    );
  }
}

class ElevatedButtonDownload extends StatelessWidget {
  const ElevatedButtonDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
        left: 50,
      ),
      child: ElevatedButton(
        child: const Text(
          'See What You Can Download',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w700,
          ),
        ),
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}

class OpenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint1 = Paint()
      ..color = Color.fromARGB(255, 65, 65, 65)
      ..style = PaintingStyle.fill;
    canvas.drawCircle(Offset(200, 200), 140, paint1);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class CustomAngledImage extends StatelessWidget {
  final double angle;
  final String url;
  final EdgeInsets margin;
  const CustomAngledImage({
    Key? key,
    required this.angle,
    required this.url,
    required this.margin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            TMDB.imageId + url,
            height: 200,
            width: 130,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}


