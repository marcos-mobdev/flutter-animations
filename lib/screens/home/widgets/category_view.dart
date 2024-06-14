import 'package:flutter/material.dart';

class CategoryView extends StatefulWidget {

  @override
  _CategoryViewState createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {

  final List<String> categories = [
    "Trabalho",
    "Estudos",
    "Casa"
  ];

  int _categoryPosition = 0;

  void selectForward(){
    setState(() {
      _categoryPosition++;
    });
  }

  void selectBackward(){
    setState(() {
      _categoryPosition--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            color: Colors.white,
            disabledColor: Colors.white30,
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: _categoryPosition > 0 ? selectBackward : null
        ),
        Text(categories[_categoryPosition].toUpperCase(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white)),
        IconButton(
          color: Colors.white,
          disabledColor: Colors.white30,
          icon: const Icon(Icons.arrow_forward_ios),
          onPressed: _categoryPosition < categories.length - 1 ? selectForward : null
        )
      ],
    );
  }
}
