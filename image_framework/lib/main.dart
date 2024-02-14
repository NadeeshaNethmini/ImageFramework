import 'package:flutter/material.dart';
import 'Final_Framework.dart';
import 'FourImages.dart';
import 'oneImage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Map<String,String>> Description = [
      {
        'title': 'Long Description1 title',
        'description': 'This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. '
      },
      {
        'title': 'Long Description2 title',
        'description': 'This is simply dummy text of the printing and typesetting industry. Lorem I This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. This is simply dummy text of the printing and typesetting industry. Lorem I This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
      },
      {
        'title': 'Short Description2 title',
        'description': 'Short Description2 ',
      },
      {
        'title': 'Short Description3 title',
        'description': 'Short Description3',
      },
      {
        'title': 'Short Description4 title',
        'description': 'Short Description4 ',
      },
      {
        'title': 'Short Description1 title',
        'description': 'Short Description4 aaaaaaaaaa ',
      },
      // {
      //   'title': 'Long Description3 title',
      //   'description': 'This is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industrys standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. ',
      // },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      color: Colors.white,
      home: Scaffold(
        body: finalFramework(Description: Description,)
      ),
    );
  }
}
