import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class threeImages extends StatelessWidget {
  threeImages({Key? key, required this.Description}) : super(key: key);

  List<Map<String,String>> longDescription=[]; //list to store long descriptions
  List<Map<String,String>> shortDescription=[]; //list to store short descriptions
  List<Map<String,String>> Description; //list of all descriptions
  List<String> images = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
    'assets/images/three.jpg'
  ]; //list of images

  @override
  Widget build(BuildContext context) {
    //if no of characters less than 40 then add to short description else long description
    shortDescription = Description.where((element) => element['description']!.length < 40).toList();
    longDescription = Description.where((element) => element['description']!.length > 40).toList();

    int shortDescriptionLength = shortDescription.length; //no of short descriptions
    int longDescriptionLength = longDescription.length; // no of long descriptions

    //no of rows for short descriptions
    int shortDescriptionRows = (shortDescriptionLength / 2).ceil();
    int longDescriptionRows = longDescriptionLength;

    //no of images
    int itemCount = images.length;

    // Calculate the aspect ratio based on the number of images
    double aspectRatio = (itemCount == 1) ? 2.0 : 1.0;


    //get orientation of the device
    Orientation orientation = MediaQuery.of(context).orientation;

    //screen width
    double screenWidth = MediaQuery.of(context).size.width;


    return Scaffold(
        body: orientation == Orientation.landscape && screenWidth>700? //check for the landscape mode of tablet
        Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        child: GestureDetector(
                          onTap: showImage(context, images[0]),
                          child: Image.asset(
                            images[0],
                            height: MediaQuery.of(context).size.height*0.2,
                            width: MediaQuery.of(context).size.width*0.2,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.2,
                          //half of the short descriptions
                          child:Column(
                            children: [
                              for (int i = 0; i < (shortDescriptionLength/2).ceil(); i++)
                                ListTile(
                                  title:Text(shortDescription[i]['title']!),
                                  subtitle:Text(shortDescription[i]['description']!),
                                )
                            ],
                          )
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        child: GestureDetector(
                          onTap: showImage(context, images[1]),
                          child: Image.asset(
                            height: MediaQuery.of(context).size.height*0.2,
                            width: MediaQuery.of(context).size.width*0.2,
                            images[1],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        child: Column(
                          children: [
                            for (int i = (shortDescriptionLength/2).ceil(); i < shortDescriptionLength; i++)
                              ListTile(
                                title:Text(shortDescription[i]['title']!),
                                subtitle:Text(shortDescription[i]['description']!),
                              )
                          ],
                        ),
                      ),
                    ]
                )
            ),
            Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width*0.2,
                      height: MediaQuery.of(context).size.height*0.2,
                      child: Image.asset(
                        images[2],
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          for (int i = 0; i < longDescriptionRows; i++)
                            ListTile(
                              title:Text(longDescription[i]['title']!),
                              subtitle:Text(longDescription[i]['description']!),
                            )
                        ],
                      ),
                    ),
                  ],
                )
            ),// Long descriptions
          ],
        ):
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: GestureDetector(
                                onTap: showImage(context, images[0]),
                                child: Image.asset(
                                  images[0],
                                  height: orientation == Orientation.landscape?MediaQuery.of(context).size.height*0.4:MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width*0.4,
                                //half of the short descriptions
                                child:Column(
                                  children: [
                                    for (int i = 0; i < (shortDescriptionLength/2).ceil(); i++)
                                      ListTile(
                                        title:Text(shortDescription[i]['title']!),
                                        subtitle:Text(shortDescription[i]['description']!),
                                      )
                                  ],
                                )
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: GestureDetector(
                                onTap: showImage(context, images[1]),
                                child: Image.asset(
                                  height: orientation == Orientation.landscape?MediaQuery.of(context).size.height*0.4:MediaQuery.of(context).size.width*0.4,
                                  width: MediaQuery.of(context).size.width*0.4,
                                  images[1],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width*0.4,
                              child: Column(
                                children: [
                                  for (int i = (shortDescriptionLength/2).ceil(); i < shortDescriptionLength; i++)
                                    ListTile(
                                      title:Text(shortDescription[i]['title']!),
                                      subtitle:Text(shortDescription[i]['description']!),
                                    )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ]
                  )
              ),
              Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*0.2,
                        height: orientation == Orientation.landscape?MediaQuery.of(context).size.width*0.2:MediaQuery.of(context).size.height*0.2,
                        child: GestureDetector(
                          onTap: showImage(context, images[2]),
                          child: Image.asset(
                            images[2],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*0.7,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            for (int i = 0; i < longDescriptionRows; i++)
                              ListTile(
                                title:Text(longDescription[i]['title']!),
                                subtitle:Text(longDescription[i]['description']!),
                              )
                          ],
                        ),
                      ),
                    ],
                  )
              ),// Long descriptions
            ],
          ),
        )
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


