import 'package:flutter/material.dart';
import 'package:image_framework/threeImages.dart';
import 'package:image_framework/twoImages.dart';
import 'FourImages.dart';
import 'oneImage.dart';

class finalFramework extends StatelessWidget {
  finalFramework({Key? key, required this.Description}) : super(key: key);
  List<Map<String,String>> longDescription=[]; //list to store long descriptions
  List<Map<String,String>> shortDescription=[]; //list to store short descriptions
  List<Map<String,String>> Description; //list to store descriptions
  List<String> images = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    // 'assets/images/one.jpg',
  ]; //list to store images

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(
                'Image Framework',
                style: TextStyle(
                  color: Colors.white,
                )
            ),
            backgroundColor: Colors.blue,
          ),
          body: images.length==1?
          oneImage(Description: Description,): //if there is only one image
         images.length==2?
          twoImages(Description: Description,): //if there are two images
          images.length==3?
          threeImages(Description: Description,): //if there are three images
          fourImages(Description: Description,), //if there are four images
      ),
    );
  }
}
