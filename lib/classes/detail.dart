import 'package:flutter/material.dart';

import 'Gif.dart';

class Detail extends StatelessWidget {
   Gif a;
   Detail({super.key,required this.a});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child:Image.network(a.url) ),);
  }
}