import 'package:flutter/material.dart';

class FilterScreen extends StatelessWidget {
  // const FilterScreen({ Key? key }) : super(key: key);

  static const routeName = 'FilterScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:const Text('Your Filters'),),
      body:const Center(child: Text('My filters'),),
    );
  }
}
