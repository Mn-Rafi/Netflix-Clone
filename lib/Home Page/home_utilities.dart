import 'package:flutter/material.dart';

playList(img, text) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          width: 125,
          height: 180,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5), topRight: Radius.circular(5)),
              image: DecorationImage(
                  opacity: 0.8, image: AssetImage("$img"), fit: BoxFit.cover)),
          child: const Icon(
            Icons.play_circle_outline_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
        Container(
            transform: Matrix4.translationValues(0.0, -18.0, 0.0),
            child: Text(
              text,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 12),
            )),
        Container(
          width: 125,
          transform: Matrix4.translationValues(0.0, -14.0, 0.0),
          child: const LinearProgressIndicator(
            value: 1 / 3,
            color: Colors.redAccent,
            backgroundColor: Color.fromARGB(255, 69, 69, 69),
          ),
        ),
        Container(
          transform: Matrix4.translationValues(0.0, -14.0, 0.0),
          padding: const EdgeInsets.all(8),
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 47, 47, 47),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5)),
          ),
          width: 125,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.info_outline,
                color: Color.fromARGB(255, 167, 167, 167),
              ),
              Icon(
                Icons.more_vert,
                color: Color.fromARGB(255, 167, 167, 167),
              )
            ],
          ),
        )
      ],
    ),
  );
}

trendingList(img) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 125,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("$img"), fit: BoxFit.cover)),
    ),
  );
}

popularOnNetflix(img) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: 125,
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          image: DecorationImage(image: AssetImage("$img"), fit: BoxFit.cover)),
    ),
  );
}
