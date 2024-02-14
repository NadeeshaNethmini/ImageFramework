import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

class twoImages extends StatelessWidget {
  twoImages({Key? key, required this.Description}) : super(key: key);

  List<Map<String,String>> longDescription=[]; //list to store long descriptions
  List<Map<String,String>> shortDescription=[]; //list to store short descriptions
  List<Map<String,String>> Description; //list of all descriptions
  List<String> images = [
    'assets/images/one.jpg',
    'assets/images/two.jpg',
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
            body: orientation == Orientation.landscape && screenWidth>800? //check for the landscape mode of tablet
            SingleChildScrollView(
              child:Column(
              children: [
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: showImage(context,images[0]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                    child: Image.asset(
                                      height: MediaQuery.of(context).size.height*0.3,
                                      images[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ),
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.55,
                            // height: MediaQuery.of(context).size.height*0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Short descriptions as 2 items per row
                                  for (int i = 0; i < (shortDescriptionRows/2).ceil(); i++)
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.15,
                                                      child: Text(
                                                        shortDescription[i * 2]['title']! + ":",
                                                        style: const TextStyle(),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.15,
                                                      child: Text(
                                                        shortDescription[i * 2]['description']!,
                                                        style: const TextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              if (i * 2 + 1 < shortDescriptionLength)
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
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
                                                        width: MediaQuery.of(context).size.width * 0.15,
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
                                      ],
                                    ),
                                  for (int i = 0; i < (longDescriptionRows/2).ceil(); i++)
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
                                            width: MediaQuery.of(context).size.width * 0.48,
                                            child: Tooltip(
                                              message: longDescription[i]['description']!,
                                              child: Text(
                                                longDescription[i]['description']!,
                                                style: const TextStyle(),
                                                maxLines: 8,
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
                Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.55,
                            // height: MediaQuery.of(context).size.height*0.3,
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  for (int i = (shortDescriptionRows/2).ceil(); i < shortDescriptionRows; i++)
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.15,
                                                      child: Text(
                                                        shortDescription[i * 2]['title']! + ":",
                                                        style: const TextStyle(),
                                                      ),
                                                    ),
                                                    Container(
                                                      width: MediaQuery.of(context).size.width * 0.15,
                                                      child: Text(
                                                        shortDescription[i * 2]['description']!,
                                                        style: const TextStyle(),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(width: 10.0),
                                              if (i * 2 + 1 < shortDescriptionLength)
                                                Container(
                                                  width: MediaQuery.of(context).size.width * 0.3,
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
                                                        width: MediaQuery.of(context).size.width * 0.15,
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
                                      ],
                                    ),
                                  for (int i = (longDescriptionRows/2).ceil(); i < longDescriptionRows; i++)
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
                                            width: MediaQuery.of(context).size.width * 0.48,
                                            child: Tooltip(
                                              message: longDescription[i]['description']!,
                                              child: Text(
                                                longDescription[i]['description']!,
                                                style: const TextStyle(),
                                                maxLines: 8,
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
                        Container(
                            width: MediaQuery.of(context).size.width*0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: showImage(context,images[1]),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                      child: Image.asset(
                                        height: MediaQuery.of(context).size.height*0.3,
                                        images[1],
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                        ),
                      ],
                    )
                ),// Long descriptions
              ],
            )):
            orientation == Orientation.portrait && screenWidth>600?
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: showImage(context,images[0]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Image.asset(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          images[0],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.55,
                              // height: MediaQuery.of(context).size.height*0.2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    // Short descriptions as 2 items per row
                                    for (int i = 0; i < (shortDescriptionRows/2).ceil(); i++)
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.15,
                                                        child: Text(
                                                          shortDescription[i * 2]['title']! + ":",
                                                          style: const TextStyle(),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.15,
                                                        child: Text(
                                                          shortDescription[i * 2]['description']!,
                                                          style: const TextStyle(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10.0),
                                                if (i * 2 + 1 < shortDescriptionLength)
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.3,
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
                                                          width: MediaQuery.of(context).size.width * 0.15,
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
                                        ],
                                      ),
                                    for (int i = 0; i < (longDescriptionRows/2).ceil(); i++)
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
                                              width: MediaQuery.of(context).size.width * 0.45,
                                              child: Tooltip(
                                                message: longDescription[i]['description']!,
                                                child: Text(
                                                  longDescription[i]['description']!,
                                                  style: const TextStyle(),
                                                  maxLines: 8,
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
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              width: MediaQuery.of(context).size.width*0.55,
                              // height: MediaQuery.of(context).size.height*0.2,
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    for (int i = (shortDescriptionRows/2).ceil(); i < shortDescriptionRows; i++)
                                      Row(
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Row(
                                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.15,
                                                        child: Text(
                                                          shortDescription[i * 2]['title']! + ":",
                                                          style: const TextStyle(),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width * 0.15,
                                                        child: Text(
                                                          shortDescription[i * 2]['description']!,
                                                          style: const TextStyle(),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(width: 10.0),
                                                if (i * 2 + 1 < shortDescriptionLength)
                                                  Container(
                                                    width: MediaQuery.of(context).size.width * 0.3,
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
                                                          width: MediaQuery.of(context).size.width * 0.15,
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
                                        ],
                                      ),
                                    for (int i = (longDescriptionRows/2).ceil(); i < longDescriptionRows; i++)
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
                                              width: MediaQuery.of(context).size.width * 0.45,
                                              child: Tooltip(
                                                message: longDescription[i]['description']!,
                                                child: Text(
                                                  longDescription[i]['description']!,
                                                  style: const TextStyle(),
                                                  maxLines: 8,
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
                          Container(
                              width: MediaQuery.of(context).size.width*0.3,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: showImage(context,images[1]),
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                        child: Image.asset(
                                          width: MediaQuery.of(context).size.width*0.2,
                                          height: MediaQuery.of(context).size.height*0.2,
                                          images[1],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                          ),
                        ],
                      )
                  ),// Long descriptions
                ],
              ),
            ):
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                  width: MediaQuery.of(context).size.width*0.3,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: GestureDetector(
                                          onTap: showImage(context,images[0]),
                                          child: Padding(
                                            padding: const EdgeInsets.fromLTRB(10, 20, 0, 0),
                                            child: Image.asset(
                                              width: MediaQuery.of(context).size.width*0.2,
                                              height: Orientation.portrait == orientation ? MediaQuery.of(context).size.height*0.2 : MediaQuery.of(context).size.width*0.2,
                                              images[0],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                              ),
                              Expanded(
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.55,
                                  // height: MediaQuery.of(context).size.height*0.2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        // Short descriptions as 2 items per row
                                        for (int i = 0; i < (shortDescription.length/2).ceil(); i++)
                                          Column(
                                            children: [
                                              ListTile(
                                                title:Text(shortDescription[i]['title']!),
                                                subtitle:Text(shortDescription[i]['description']!),
                                              )
                                            ],
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      )
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children:[
                        for (int i = 0; i < longDescriptionLength; i++)
                          Container(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                ListTile(
                                  title:Text(longDescription[i]['title']!),
                                  subtitle:Text(longDescription[i]['description']!),
                                )
                              ],
                            ),
                          ),
                      ]
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: Container(
                          width: MediaQuery.of(context).size.width*0.55,
                          // height: MediaQuery.of(context).size.height*0.2,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                // Short descriptions as 2 items per row
                                for (int i = (shortDescription.length/2).ceil();i<shortDescriptionLength; i++)
                                  Column(
                                    children: [
                                      ListTile(
                                        title:Text(shortDescription[i]['title']!),
                                        subtitle:Text(shortDescription[i]['description']!),
                                      )
                                    ],
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                          width: MediaQuery.of(context).size.width*0.3,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: showImage(context,images[0]),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(10, 20, 15, 10),
                                    child: Image.asset(
                                      width: MediaQuery.of(context).size.width*0.2,
                                      height:Orientation.portrait == orientation ? MediaQuery.of(context).size.height*0.2 : MediaQuery.of(context).size.width*0.2,
                                      images[0],
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                      ),
                    ],
                  ),
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


