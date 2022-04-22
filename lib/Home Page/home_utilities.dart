import 'package:flutter/material.dart';
import 'package:bordered_text/bordered_text.dart';
import 'package:netflix_ui/API/tmdb_links.dart';

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
                  opacity: 0.8,
                  image: Image.network(img).image,
                  fit: BoxFit.cover)),
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
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
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

playListShimmer() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      children: [
        Container(
          width: 125,
          height: 180,
          decoration: const BoxDecoration(
            color: Colors.grey,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(5), topRight: Radius.circular(5)),
          ),
          child: const Icon(
            Icons.play_circle_outline_rounded,
            color: Colors.white,
            size: 40,
          ),
        ),
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
                bottomLeft: Radius.circular(5),
                bottomRight: Radius.circular(5)),
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
          image: DecorationImage(
              image: Image.network(img).image, fit: BoxFit.cover)),
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
          image: DecorationImage(
              image: Image.network(img).image, fit: BoxFit.cover)),
    ),
  );
}

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.image})
      : super(key: key);
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
              height: 100,
            ),
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${TMDB.imageId}$image'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 65,
          child: BorderedText(
            strokeColor: Colors.white,
            strokeWidth: 3,
            child: Text(
              '$index',
              style: const TextStyle(
                fontSize: 85,
                color: Colors.black,
              ),
            ),
          ),
        )
      ],
    );
  }
}