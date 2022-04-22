import 'package:flutter/material.dart';

class CustomGridContainer extends StatelessWidget {
  final String url;
  const CustomGridContainer({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(url, fit: BoxFit.cover, height: 100,);
  }
}
