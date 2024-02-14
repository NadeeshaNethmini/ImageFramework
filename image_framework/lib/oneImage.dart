import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class oneImage extends StatelessWidget {
  oneImage({Key? key, required this.Description}) : super(key: key);

  List<Map<String,String>> longDescription=[]; //list to store long descriptions
  List<Map<String,String>> shortDescription=[]; //list to store short descriptions
  List<Map<String,String>> Description; //list of all descriptions
  List<String> images = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg',
    'assets/images/one.jpg',
  ]; //list of images

  @override
  Widget build(BuildContext context) {
    //if no of characters less than 40 then add to short description else long description
    shortDescription = Description.where((element) => element['description']!.length < 40).toList();
    longDescription = Description.where((element) => element['description']!.length > 40).toList();

    int shortDescriptionLength = shortDescription.length; //no of short descriptions
    int longDescriptionLength = longDescription.length; // no of long descriptions

    //no of rows required for short descriptions
    int shortDescriptionRows = (shortDescriptionLength / 2).ceil();

    //no of images
    int itemCount = images.length;

    // Calculate the aspect ratio based on the number of images
    double aspectRatio = (itemCount == 1) ? 2.0 : 1.0;


    //get orientation of the device
    Orientation orientation = MediaQuery.of(context).orientation;

    //screen width
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        body: orientation == Orientation.landscape && screenWidth>800? //check for the landscape mode of tablet
        SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      child: GestureDetector(
                        onTap: showImage(context,images[0]),
                        child: Image.asset(
                          width: MediaQuery.of(context).size.width*0.2,
                          height: MediaQuery.of(context).size.height*0.3,
                          images[0],
                          // fit: BoxFit.cover,
                        ),
                      )
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.6,
                      // height: MediaQuery.of(context).size.height*0.4,
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            // Short descriptions as 2 items per row
                            for (int i = 0; i < shortDescriptionRows; i++)
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context).size.width * 0.35,
                                            child: Container(
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.15,
                                                    child: Text(
                                                      shortDescription[i * 2]['title']! + ":",
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    child: Text(
                                                      shortDescription[i * 2]['description']!,
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 10.0),
                                          if (i * 2 + 1 < shortDescriptionLength)
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.35,
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.15,
                                                    child: Text(
                                                      shortDescription[i * 2 + 1]['title']! + ":",
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.2,
                                                    child: Text(
                                                      shortDescription[i * 2 + 1]['description']!,
                                                      style: const TextStyle(),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            // Long descriptions
                            for (int i = 0; i < longDescriptionLength; i++)
                              Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.15,
                                      child: Text(
                                        longDescription[i]['title']! + ":",
                                        style: const TextStyle(),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.5,
                                      child: Tooltip(
                                        message: longDescription[i]['description']!,
                                        child: Text(
                                          longDescription[i]['description']!,
                                          style: const TextStyle(),
                                          maxLines: 4,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )
          ),
        ):
        SingleChildScrollView(
            child:Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: showImage(context,images[0]),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        images[0],
                      ),
                    ),
                  ),
                ) ,
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      for (int i = 0; i < shortDescriptionRows; i++)
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width * 0.4,
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              child: Text(
                                                shortDescription[i * 2]['title']! + ":",
                                                style: const TextStyle(),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.25,
                                              child: Text(
                                                shortDescription[i * 2]['description']!,
                                                style: const TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10.0),
                                    if (i * 2 + 1 < shortDescriptionLength)
                                      Container(
                                        width: MediaQuery.of(context).size.width * 0.4,
                                        child: Row(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.15,
                                              child: Text(
                                                shortDescription[i * 2 + 1]['title']! + ":",
                                                style: const TextStyle(),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context).size.width * 0.25,
                                              child: Text(
                                                shortDescription[i * 2 + 1]['description']!,
                                                style: const TextStyle(),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      // Long descriptions
                      for (int i = 0; i < longDescriptionLength; i++)
                        Container(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.15,
                                child: Text(
                                  longDescription[i]['title']! + ":",
                                  style: const TextStyle(),
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width * 0.65,
                                child: Text(
                                  longDescription[i]['description']!,
                                  style: const TextStyle(),
                                ),
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            )
        ))
    );
  }

  showImage(BuildContext context, String imag) { //display image in dialog box when clicked
    return () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: InteractiveViewer(  //to zoom in and out the image
              child: Image.asset(imag),
            ),
          );
        },
      );
    };
  }
}


