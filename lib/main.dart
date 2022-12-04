import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PixabayPage(),
    );
  }
}

class PixabayPage extends StatefulWidget {
  const PixabayPage({super.key});

  @override
  State<PixabayPage> createState() => _PixabayPageState();
}

class _PixabayPageState extends State<PixabayPage> {
  List hits = [];

  Future<void> fetchImages() async {
    Response response = await Dio().get(
        'https://pixabay.com/api/?key=31821546-403905daa067bce56b9b86635&q=yellow+flowers&image_type=photo');
    int hits = response.data['hits'];
    setState(() {});
    print(hits);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemCount: hits.length,
      itemBuilder: (context, index) {
        Map<String, dynamic> hit = hits[index];
        return Image.network(hit['previewURL']);
      },
    ));
  }
}
