import 'package:flutter/material.dart';

class IconWidget extends StatelessWidget {

  final String url;
  final double size;

  const IconWidget({Key key, @required this.url, @required this.size}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return (url == null)
        ? Container(height: size, width: size,)
        : Image.network(url, height: size, width: size,);

  }
}
