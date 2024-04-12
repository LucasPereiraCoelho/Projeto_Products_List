import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_application_4/views/detail_product.dart';

class TestView extends StatefulWidget {
  List images;
  String title;
  String description;
  int price;
  String brand;
  String category;

  TestView(
      {super.key,
      required this.images,
      required this.title,
      required this.description,
      required this.price,
      required this.brand,
      required this.category});

  @override
  State<TestView> createState() => _State();
}

class _State extends State<TestView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network('${widget.images.first}', width: 500, height: 500, fit: BoxFit.cover),
                Text(
                  'Descrição: ${widget.description}',
                ),
                Text(
                  'Preço: ${widget.price}',
                ),
                Text(
                  'Marca: ${widget.brand}',
                ),
                Text(
                  'Categoria: ${widget.category}',
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => DetalProducts()),
                    );
                  },
                  child: Text('Voltar para detalhe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
